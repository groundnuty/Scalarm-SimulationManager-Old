package Scalarm::ExperimentManager;
use Scalarm::Simulation;
use Scalarm::Utils ;
use Mojo::Base -base ;

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


# All the action usually takes place in ./ but for purpose of testing, root/prefix dir is necessary
has root => "" ;
has code_base_name => "code_base" ;

#Fields read form the config file
has experiment_id => undef ;
has experiment_manager_address => undef;
has user => undef ;
has pass => undef ;

# Check if there is already experiment directory
	# Download experiment
	# Unzip content
	# adjust permissions
sub get_experiment {
	my ($self) = @_;
	unless($self->does_experiment_exist()) {
		$self->create_experiment_dir();
		my $path = $self->_download_experiment();
		$self->_extract_experiment($path);
		$self->_change_permissions();
	}
	#if the directory exists we assume that the whole
	#directory structure is present
}

sub _download_experiment {
	my ($self) = @_;
	my $tx = Scalarm::Utils::do_the_get(
		$self->experiment_manager_address,
		$self->experiment_id."/code_base",
		$self->user,
		$self->pass);
	#result is saved as some tmp file, it needs to be moved to proper file
	$tx->res->content->asset->move_to($self->get_code_base().'.zip');
	return $self->get_code_base().'.zip';
	
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

sub get_simulation {
	my $self = shift;
	my $next_simulation_config = $self->_get_simulation();
	my $next_simulation = Scalarm::Simulation->new(
		simulation_id => $next_simulation_config->{'simulation_id'},
		execution_constraints => $next_simulation_config->{'execution_constraints'},
		input_parameters => $next_simulation_config->{'input_parameters'},
		parent_dir=>$self->get_experiment_dir(),
		parent=>$self
		);
	
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
	
sub _get_simulation {
	my $self = shift;
	my $response = Scalarm::Utils::do_the_get(
		$self->experiment_manager_address,
		$self->experiment_id."/next_simulation",
		$self->user,
		$self->pass);
	$response = Scalarm::Utils::decode_json($response->res->body);
	return $response;
}


#Getters for proper path handling
sub get_code_base_dir {
	my ($self) = @_;
	return $self->get_experiment_dir().$self->code_base_name.'/';
}
sub get_code_base {
	my ($self) = @_;
	return $self->get_experiment_dir().$self->code_base_name;
}
sub get_experiment_dir {
	my ($self) = @_;
	return $self->root.'experiment_'.$self->experiment_id.'/';
}

#Helper functions to ease the testing/debugging
sub does_experiment_exist {
	return -e shift->get_experiment_dir();
}

sub create_experiment_dir {
	mkdir(shift->get_experiment_dir());
}








1;
