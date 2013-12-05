package Scalarm::Simulation;

use Mojo::Base -base;
use Mojo::JSON;

use Log::Log4perl qw(:easy);
my $log_conf = "log4perl.conf";
Log::Log4perl->init($log_conf);

my $json =  Mojo::JSON->new;

has simulation_id => undef;
has execution_constraints => undef;
has input_parameters => undef;
has parent_dir =>undef;
has simulation_input_file => "input.json";
has simulation_output_file => "output.json";
has parent =>undef;
sub run {
	my $self = shift;
	if(!$self->does_simulation_exist()) {
		$self->create_experiment_dir();

		open (FH, ">".$self->get_simulation_dir()."".$self->simulation_input_file);
		print(FH $json->encode($self->input_parameters));
		close(FH);
		my (@cmd, $output);

		@cmd = ("ls -lR",$self->get_simulation_dir());
		$output=`@cmd`;
		INFO($output);
		my $pwd = "";
		@cmd = ("pwd");
		$pwd=`@cmd`;
		INFO($output);


		chdir($self->get_simulation_dir()) or die "Cant chdir to ".$self->get_simulation_dir()." $!";

		
		@cmd = ("../".$self->parent->code_base_name."/input_writer",$self->simulation_input_file);
		$output=`@cmd`;
		INFO(@cmd);
		INFO($output);


		@cmd = ("../".$self->parent->code_base_name."/executor",$self->simulation_input_file);
		$output=`@cmd`;
		INFO(@cmd);
		INFO($output);


		@cmd = ("../".$self->parent->code_base_name."/output_reader",$self->simulation_input_file);
		$output=`@cmd`;
		INFO(@cmd);
		INFO($output);

		

		chdir($pwd);
		

		open (FH, "<".$self->get_simulation_dir()."".$self->simulation_output_file) or die "error!";
		my $output_sim = do {local $/; <FH> };
		INFO($output_sim);
		$output_sim = $json->decode($output_sim);
		close(FH);
		

		@cmd = ("ls -lR");
		$output=`@cmd`;
		INFO($output);

		FATAL($output_sim->{'status'});
	}

}

sub create_experiment_dir {
	mkdir(shift->get_simulation_dir()) or die "ERROR";
}


sub get_simulation_dir {
	my $self = shift;
	return $self->parent_dir."simulation_".$self->simulation_id."/" ;
}

sub does_simulation_exist {
	my ($self) = @_;
	return -e $self->get_simulation_dir();
}

sub upload_output {

}

sub upload_binary_output {
	
}


1;