package Scalarm::SimulationManager;

use strict;
use warnings ;

#use Mojo::Base -base;

our $VERSION = '0.01';

use Log::Log4perl qw(:easy);
my $log_conf = "log4perl.conf";
Log::Log4perl->init($log_conf);


use Mojo::JSON ; 
use Test::More ;

sub execute_simulation {
	my ($em_proxy,$simulation) = @_;
    INFO("Next simulation has an id: ".$simulation->{'simulation_id'});
    TRACE("With following execution constraints:".$simulation->{'execution_constraints'});

    my $simulation_directory = $em_proxy->experiment_dir."/simulation_".$em_proxy->simulation_id;

    
    
}

sub get_next_simulation {
	my ($em_proxy) = @_;
	my $next_simulation = $em_proxy->next_simulation() ;

	#Check if returned simulation_id is correct
	unless ($next_simulation->{'simulation_id'} ==  $em_proxy->simulation_id) {
		return 0 ;
	}
	#TODO: do we really want just 2 states 0 and 1 to be returned?
	if ($next_simulation->{status} eq 'ok') {
		INFO("Received ");
		return (1,$next_simulation) ;
	} elsif ($next_simulation->{status} eq 'all_sent') {
		INFO("No simulation received - all sent.");
		return 0 ;
	} elsif ($next_simulation->{status} eq 'error') {		
		INFO("Error while receiving next simulation.");
		return 0 ;
	}
}


sub  get_experiment_repository {	
	my ($em_proxy) = @_;
	if( not -e $em_proxy->get_code_base_dir()) {
  		my $code_base = $em_proxy->get_experiment();

	}
}

sub prepare_experiment {
	my ($experiment_id) = @_;
	# 2. check if an experiment id is specified and if there is no experiment id get one
	#if not config.has_key?('experiment_id')
	#  puts 'Getting experiment id'
	#
	#  while (experiment_id = em_proxy.get_experiment_id.to_i) == 0
	#    sleep 30
	#  end
	#
	#else
	#end
	INFO "We will execute simulations from an experiment with ID $experiment_id" ;
	my $experiment_dir = "experiment_$experiment_id"; 

	if(not -e $experiment_dir) {
    	mkdir($experiment_dir);
	} 
}


sub load_config {
	my ($config_file) = @_;
	open(my $config_handle, '<', $config_file) or FATAL("Can't open $config_file : $!");
	my $config_raw = do {local $/; <$config_handle> };
	my $json = Mojo::JSON->new;
	my $config = $json->decode($config_raw);
	if($json->error) {
		ERROR $json->error; 
	}
	return $config;
	
}

1;
