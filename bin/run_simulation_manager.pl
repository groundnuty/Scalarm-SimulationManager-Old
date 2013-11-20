#! /usr/bin/perl -w

use 5.012; # implies "use strict;"
use warnings;
use autodie;



use InformationService;
use StorageManager;
use ExperimentManager;
use SimulationManager;

#Constants
my $code_base_dir="code_base";
my ($all_sent_threshold, $error_threshold) = (10,10);


#Load Configuration
my %config = SimulationManager::load_config("config.json");
my $experiment_id = %config->{"experiment_id"};

my $experiment_manager=ExperimentManager->new($experiment_id,);

SimulationManager::prepare_experiment($experiment_id);

SimulationManager::get_experiment_repository($experiment_manager);

