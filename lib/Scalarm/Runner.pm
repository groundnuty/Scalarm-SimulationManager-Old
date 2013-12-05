package Scalarm::Runner;
use Mojo::Base -base;

use Scalarm::SimulationManager;
use Scalarm::ExperimentManager;

has config_file_path => undef ;
has all_sent_threshold => 10 ;
has error_threshold => 10 ;
has code_base_dir => "code_base" ;

has experiment_manager => undef ;
has simulation_manager => undef ;


sub run {
	my $self = shift;
	$self->setup_experiment();
	#$self->execute();
}

sub setup_experiment {
	my $self = shift;

	#Parse configuration
	my $config = Scalarm::Utils::load_config($self->config_file_path);
 
	#Initialize Experiment Manager
	$self->experiment_manager(Scalarm::ExperimentManager->new(
		experiment_id => $config->{"experiment_id"},
		experiment_manager_address=>$config->{"information_service_url"},
		user => $config->{"experiment_manager_user"},
		pass => $config->{"experiment_manager_pass"}));

	#Get experiment sources
	$self->experiment_manager->get_experiment();
}

sub execute {
	my $self = shift;
	print "executing!";
	EXPERIMENT_LOOP: {
		while(1) {
			sleep 1;
			my ($status,$next_simulation) = $self->experiment_manager->get_simulation();
			#TODO: refactor this to have just one invocation
			if($status == 1) {
				$next_simulation->run() ;
			} elsif($status == 0) {
				if($self->error_threshold <= 0) {
					break EXPERIMENT_LOOP;
				} else {
					SimulationManager::execute_simulation($self->experiment_manager) ;
					$self->error_threshold = $self->error_threshold - 1;
				}
			} elsif($status == -1) {
				if($self->all_sent_threshold <= 0) {
					break EXPERIMENT_LOOP;
				} else {
					SimulationManager::execute_simulation($self->experiment_manager) ;
					$self->all_sent_threshold = $self->all_sent_threshold - 1;
				}
			}
		}
	}

}

1;