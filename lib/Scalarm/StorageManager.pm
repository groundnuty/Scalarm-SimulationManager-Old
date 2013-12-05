package Scalarm::StorageManager;

use Mojo::Base -base;

use Log::Log4perl qw(:easy);
my $log_conf = "log4perl.conf";
Log::Log4perl->init($log_conf);


has simulation_id => undef;



sub run {

}

sub monitor_progress  {

}

sub upload_output {

}

sub upload_binary_output {
	
}


1;