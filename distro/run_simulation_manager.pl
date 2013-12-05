#! /usr/bin/perl -w

use 5.012; # implies "use strict;"
use warnings;
use autodie;


use lib ("./Scalarm");
use lib ("./Mojo");
#use InformationService;
#use StorageManager;
#use ExperimentManager;
#use Scalarm::SimulationManager;

#Constants
my $code_base_dir="code_base";
my ($all_sent_threshold, $error_threshold) = (10,10);


#Load Configuration
SimulationManager::a();
my $config = Scalarm::SimulationManager::load_config("config.json");
my $experiment_id = $config->{"experiment_id"};

my $experiment_manager=ExperimentManager->new($experiment_id,);

SimulationManager::prepare_experiment($experiment_id);

SimulationManager::get_experiment_repository($experiment_manager);

while(1) {
	my ($status,$next_simulation) = SimulationManager::get_next_simulation($experiment_manager);

	#TODO: refactor this to have just one invocation
	if($status == 1) {
		SimulationManager::execute_simulation($experiment_manager) ;
	} elsif($status == 0) {
		if($error_threshold <= 0) {
			break ;
		} else {
			SimulationManager::execute_simulation($experiment_manager) ;
			$error_threshold = $error_threshold - 1;
		}
	} elsif($status == -1) {
		if($all_sent_threshold <= 0) {
			break ;
		} else {
			SimulationManager::execute_simulation($experiment_manager) ;
			$all_sent_threshold = $all_sent_threshold - 1;
		}
	}

}