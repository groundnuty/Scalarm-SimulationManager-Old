package Scalarm::SimulationManager;

use strict;
use warnings ;

our $VERSION = '0.01';

use Log::Log4perl qw(:easy);
Log::Log4perl->easy_init($ERROR);

use Mojo::JSON;
use Test::More ;

sub load_config {
	my ($config_file) = @_;
	open(my $config_handle, '<', $config_file) or die "Can't open $config_file : $!";
	my $config_raw = do {local $/; <$config_handle> };
	my $json = Mojo::JSON->new;
	my $config = $json->decode($config_raw);
	if($json->error) {
		ERROR $json->error; 
	}
	return $config;
	
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

sub  get_experiment_repository {
	my ($em_proxy) = @_;
	if( not -e $em_proxy->code_base_dir) {
  		my $code_base = $em_proxy->download_code_base;

  		
  		#TODO przepisaćcto na Archive::Zip
  		my @cmd = ('unzip', ' -d ', $em_proxy->code_base_dir," ", $code_base);
  		ERROR @cmd;
  		system @cmd;
  		
  		my @files = <./$code_base/*>;
  		foreach my $file (@files) {
    		if (-f $file) {
    			ERROR $file;
        		#chmod(0777, $file);
    		}
  		}

  	#ORZECH: tu pewnie jest blad
  	#chmod(0777, $code_base_dir);
	}
}


1;
