package Scalarm::ExperimentManager;
use Scalarm::Simulation;
use Mojo::Base -base;
use Mojo::JSON;
use Mojo::UserAgent;

my $agent = Mojo::UserAgent->new;
my $json =  Mojo::JSON->new;

use Log::Log4perl qw(:easy);
my $log_conf = "log4perl.conf";
Log::Log4perl->init($log_conf);


has experiment_id => undef ;
has root => "" ;
has code_base_name => "code_base" ;

sub load_config {
	my ($config_file) = @_;
	open(my $config_handle, '<', $config_file) or FATAL("Can't open $config_file : $!");
	my $config_raw = do {local $/; <$config_handle> };
	my $config = $json->decode($config_raw);
	if($json->error) {
		ERROR $json->error; 
	}
	return $config;
}

sub get_experiment {
	my ($self) = @_;
	# 1. Check if there is already experiment directory
		# 1.1 Download experiment
		# 1.2 Unzip content
	if(! $self->does_experiment_exist()) {
		$self->create_experiment_dir();
		my $path = $self->_download_experiment();
		$self->_extract_experiment($path);
		$self->_change_permissions();
	}
}

sub does_experiment_exist {
	my ($self) = @_;
	return -e $self->get_experiment_dir();
}

sub create_experiment_dir {
	mkdir(shift->get_experiment_dir());
}


sub get_experiment_dir {
	my ($self) = @_;
	return $self->root.'experiment_'.$self->experiment_id.'/';
}

sub get_code_base_dir {
	my ($self) = @_;
	return $self->get_experiment_dir().$self->code_base_name.'/';
}


sub _download_experiment {
	my $self = shift;
	my $response = $agent->get($self->_path_to($self->experiment_id."/code_base"));
	#my $response = $agent->get("https://dl.dropboxusercontent.com/u/25120614/code_base.zip");
	$response->res->content->asset->move_to($self->code_base_name.'.zip');
	
	return $response ;
	
}

sub _path_to {
    my($self,$method) = @_;
    return 'https://'.$self->{_experiment_manager_address}.'/experiments/'.$method;
}

sub _extract_experiment {
	my ($self,$path_to_archive) = @_;
	#Extracts experiment code base and simulation binaries

	my (@cmd, $output) ;
	@cmd = ('unzip','-d',$self->get_code_base_dir, $path_to_archive);
	$output = `@cmd`;
	if ( $? != 0 ) {
		FATAL("@cmd command failed: $!\n");
	} else {
		TRACE("Successfully unzipped ".$self->get_code_base_dir);
		TRACE($output);
	}

	@cmd = ('unzip','-d',$self->get_code_base_dir, $self->get_code_base_dir."/simulation_binaries.zip");
	$output = `@cmd`;
  	if ( $? != 0 ) {
		FATAL("@cmd command failed: $!\n");
	} else {
		TRACE("Successfully unzipped ".$self->get_code_base_dir."/simulation_binaries.zip");
		TRACE($output);
	}

	return $?;
}

sub _change_permissions {
	my $self = shift;	

	#TODO: Might need better error handling
	sub traverse {
		my ($path) = @_;
		my @files = <$path/*>;
		#bylo a+x, proponuje:
		chmod(0755, $path)  or ERROR("Cannot change permissions on file: $path");	
		TRACE("Changed permissions of directory $path 0755");
		foreach my $file (@files) {
		if (-f $file) {   
			#bylo 0777, proponuje:
			chmod(0744, $file) or ERROR("Cannot change permissions on file: $file");
			TRACE("Changed permissions of file $file 0777");
		} elsif (-d $file) {
			traverse($file);
		} else {
			WARN("$file. not recognized as file not directory.")
		}
		}
		return $?;
	}
	my @cmd;
	traverse($self->get_code_base_dir);
	INFO("Unzipped and chmod-ed the content of".$self->get_code_base_dir); 
	@cmd = ('ls',' -alR',$self->get_code_base_dir);		
	INFO(qx/@cmd/);

  	return $?;
  	
}

sub _get_simulation {
	my $self = shift;
	my $response = $agent->get($self->_path_to($self->experiment_id."/next_simulation"));
	return $response->content;
}

sub get_simulation {
	my $self = shift;
	my $response = $self->_get_simulation();
	my $next_simulation_config = $json->decode($response);
	my $next_simulation = undef ;
	if($json->error) {
		ERROR $json->error; 
	} else {
		$next_simulation = Scalarm::Simulation->new(
			simulation_id => $next_simulation_config->{'simulation_id'},
			execution_constraints => $next_simulation_config->{'execution_constraints'},
			input_parameters => $next_simulation_config->{'input_parameters'},
			parent_dir=>$self->get_experiment_dir(),
			parent=>$self
			);
	}
	
	#FATAL($next_simulation->execution_constraints);

	#Check if returned simulation_id is correct
	#unless ($next_simulation->{'simulation_id'} ==  $em_proxy->simulation_id) {
	#	return 0 ;
	#}
	#TODO: do we really want just 2 states 0 and 1 to be returned?
	if ($next_simulation_config->{status} eq 'ok') {
		INFO("Received ");
		return (1,$next_simulation) ;
	} elsif ($next_simulation_config->{status} eq 'all_sent') {
		INFO("No simulation received - all sent.");
		return -1 ;
	} elsif ($next_simulation_config->{status} eq 'error') {		
		ERROR("Error while receiving next simulation.");
		return 0 ;
	}

}
	
	#get experiment id
	#be aware what is 'home/root' dir for executing experiment
	#create experiment directory
	
	#get experiment source 
		#download
		#unzip
		#chmod

	#fetch information about new simulation that is to be executed as the part of experiment
	#create simulation
		#feed it with constrains from config
		#run simulation
			#simulation will  run an adapter script (input writer)
			#simulation has to have ability to monitor its progress
			#simulation will run an adapter script (output reader) to (output.json)
			#will upload output json to experiment manager and set the run simulation as done
			#will upload binary_output if provided
			#exit to experiment manager


1;
