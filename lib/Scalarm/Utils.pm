package Scalarm::Utils;
#ALL THE MESSY PERL STUFF IS HERE

use Data::Dump qw(dump);

use Mojo::JSON;
use Mojo::UserAgent;

use Log::Log4perl;
my $log_conf = "log4perl.conf";
Log::Log4perl->init($log_conf);
my $logger = Log::Log4perl->get_logger();

#Export magic that I dont fully understand
use Exporter;
use vars qw(@ISA @EXPORT);
@ISA=qw(Exporter);
@EXPORT    = qw(INFO TRACE FATAL WARN ERROR); 

my $json =  Mojo::JSON->new;
my $agent = Mojo::UserAgent->new;

sub load_config {
	my ($config_file) = @_;
	open(my $config_handle, '<', $config_file) or FATAL("Can't open $config_file : $!");
	my $config_raw = do {local $/; <$config_handle> };
	my $config = $json->decode($config_raw);
	if($json->error) {
		ERROR $json->error; 
	}
	dump($config);
	return $config;
}


sub decode_json {
	my ($config_file) = @_;
	open(my $config_handle, '<', $config_file) or FATAL("Can't open $config_file : $!");
	my $config_raw = do {local $/; <$config_handle> };
	my $config = $json->decode($config_raw);
	if($json->error) {
		ERROR $json->error; 
	}
	dump($config);
	return $config;
}

sub encode_json {
	my ($data) = @_;
	my $config = $json->encode($data);
	if($json->error) {
		ERROR $json->error; 
	}
	dump($config);
	return $config;
}

sub get_url_to_experiment_manager {
    my($experiment_manager_address,$method,$user,$pass) = @_;
    return Mojo::URL->new('https://'.$experiment_manager_address.'/experiments/'.$method)->userinfo($user.":".$pass);
}


sub do_the_get {
	my $url = get_url_to_experiment_manager(@_);
	my $tx = $agent->get($url);
	if (my $res = $tx->success) { 
		INFO("get request to $url was succesful")
	} else {
    	my ($err, $code) = $tx->error;
    	ERROR($code ? "$code response: $err" : "Connection error: $err");
  	}
	
    return $tx;
}

sub do_the_post {
	return $agent->post(get_url_to_experiment_manager(@_))
}

#wrapper functions for logging
sub FATAL {
	$logger->fatal(@_);
}

sub ERROR {
	$logger->error(@_);
}


sub TRACE {
	$logger->trace(@_);
}

sub WARN {
	$logger->warn(@_);
}

sub INFO {
	$logger->info(@_);
}
