package Scalarm::Simulation;
use Mojo::Base -base;
use Scalarm::Utils;

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
		print(FH Scalarm::Utils::encode_json($self->input_parameters));
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

		

		chdir("../..");
		#print `ls -la .`;
		#print $pwd."\n";
		#print $self->get_simulation_dir()."".$self->simulation_output_file."\n";
		open (FHo, "<".$self->get_simulation_dir()."".$self->simulation_output_file) or die "error! $!";
		my $output_sim_json = do {local $/; <FHo> };
		INFO($output_sim_json);
		my $output_sim = Scalarm::Utils::decode_json($output_sim_json);
		close(FHo);
		

		#@cmd = ("ls -lR");
		#$output=`@cmd`;
		#INFO($output);

		$self->upload_output($output_sim->{status});

		FATAL($output_sim->{'status'});
	}

}

sub create_experiment_dir {
	my $self = shift;
	print $self->get_simulation_dir();
	mkdir($self->get_simulation_dir()) or die "ERROR";
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
	use Mojo::UserAgent;
	my $json =  Mojo::JSON->new;
	my $agent = Mojo::UserAgent->new;

	my ($self,$output) = @_ ;
	my ($u,$p) = ($self->parent->experiment_manager_user,$self->parent->experiment_manager_pass);
	
	my $url = Mojo::URL->new($self->parent->_path_to($self->parent->experiment_id."/simulations/".$self->simulation_id."/mark_as_complete"))->userinfo("$u:p");
	my $response = $agent->post($url => json => {$output});
	
    #http = Net::HTTP.new(uri.host, uri.port)
    #http.use_ssl = true
    #http.ssl_version = :SSLv3
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #request = Net::HTTP::Post.new(uri.request_uri)
    #request.basic_auth(@user, @pass)
    #request.set_form_data({'result' => results.to_json})

    #http.request(request).body
}

sub upload_binary_output {
	
}


1;