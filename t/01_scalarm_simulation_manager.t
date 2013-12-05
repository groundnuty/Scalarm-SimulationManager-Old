#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More ;

my $devel_skip_reason = 'When we develop a test we want execute just that test :)' ;
my $devel_skip_falg = 1 ;
BEGIN {
	use_ok('Scalarm::SimulationManager')

}
 
SKIP: {
	skip $devel_skip_reason, 0 if $devel_skip_falg ;
	use File::Temp qw/ tempfile tempdir /;

	#PREPARE	
	can_ok('Scalarm::SimulationManager','load_config');
	my $test_tempdir = File::Temp->newdir();
	
	my $test_config_file_content = qq(
	{
		"information_service_url":"system.scalarm.com:11300",
		"experiment_manager_user":"dkrol-laptop",
		"experiment_manager_pass":"somepassword",
		"experiment_id":"520f4dcdfc3ff9483c000002"
	} );
	


 	my ( $fh, $file ) = tempfile();
 	print $fh $test_config_file_content;
 	close($fh); #file empty without this line
 	

 	#EXECUTE
 	my $result = Scalarm::SimulationManager::load_config($file);
 	
	#ASSERT
	ok($result,'Config file parsed');
	isa_ok($result, 'HASH', 'Parsed data is of correct type' );
	is(keys(%$result),4,'Exactly 4 elements in configuration file - as expected');

	my $tested_parameter = 'information_service_url';
	ok($result->{$tested_parameter},"$tested_parameter parameter present");
	
	$tested_parameter = 'experiment_manager_user';
	ok($result->{$tested_parameter},"$tested_parameter parameter present");
	
	$tested_parameter = 'experiment_manager_pass';
	ok($result->{$tested_parameter},"$tested_parameter parameter present");
	
	$tested_parameter = 'experiment_id';
	ok($result->{$tested_parameter},"$tested_parameter parameter present");
	
}


SKIP: {
		skip $devel_skip_reason, 0 if $devel_skip_falg ;
		use Test::MockObject;
		use File::Temp qw/ tempfile tempdir /;
		use File::Copy qw(copy);
		
		#PREPARE
		can_ok('Scalarm::SimulationManager','get_experiment_repository');

		my $test_tempdir = File::Temp->newdir();
		my $test_file_name = "test_code_base.zip";
		#This file is expected to contain into:
		my @files = (
			"input_writer",
			"executor",
			"output_reader",
			"progress_monitor",
			"simulation_binaries.zip",
		);
		#simulation_binaries.zip is expected to contain:
		my @sfiles = (
			"simulation_binaries"
		);

		my $source = "t/resources/$test_file_name";
		my $destination = "$test_tempdir/$test_file_name";
		copy($source ,$destination) or die "Copy failed: $!" ;
		ok(-e $destination, "Check if file was copied at all.");

		my $experiment_manager_mock = Test::MockObject->new();
		$experiment_manager_mock ->mock('download_code_base', sub { return $destination });

		#TODO nie podoba mi sie zahardocowane code_base
		$experiment_manager_mock ->mock('code_base_dir', sub { return "$test_tempdir/code_base"});

		#EXECUTE
		Scalarm::SimulationManager::get_experiment_repository($experiment_manager_mock);


		#ASSERT
		ok(-e -d $experiment_manager_mock->code_base_dir, "Check if 'code base' directory was created.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[0], "File '$files[0]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[1], "Check if file '$files[1]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[2], "Check if file '$files[2]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[3], "Check if file '$files[3]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[4], "Check if file '$files[4]' was extracted.");

		ok(-e -d $experiment_manager_mock->code_base_dir."/".$sfiles[0], "Check if directory '$sfiles[0]' was created.");

		#TODO: Those tests only cover users permissions not group nor all
		ok(-r -w -x $experiment_manager_mock->code_base_dir."/".$files[0], "File '$files[0]' has permissions set.");
		ok(-r -w -x $experiment_manager_mock->code_base_dir."/".$files[1], "File '$files[1]' has permissions set.");
		ok(-r -w -x  $experiment_manager_mock->code_base_dir."/".$files[2], "File '$files[2]' has permissions set.");
		ok(-r -w -x  $experiment_manager_mock->code_base_dir."/".$files[3], "File '$files[3]' has permissions set.");
		ok(-r -w -x  $experiment_manager_mock->code_base_dir."/".$files[4], "File '$files[4]' has permissions set.");

		ok(-e -r -w -x $experiment_manager_mock->code_base_dir."/".$sfiles[0], "Directory '$sfiles[0]' was created.");


}


{
	use Test::MockObject;
	use Mojo::JSON;
	#PREPARE
	can_ok('Scalarm::SimulationManager','get_next_simulation');

	my $server_responsee = qq({
		"status":"ok",
		"simulation_id":47,
		"execution_constraints": {"time_contraint_in_sec":3600},
			"input_parameters": {
				"setup___microstructure_coefficients___volume_fraction_reference_value":"0.44972270447530865",
				"setup___microstructure_coefficients___volume_fraction_weight":"0.0",
				"setup___microstructure_coefficients___max_s_reference_value":"-1.0",
				"setup___microstructure_coefficients___max_s_weight":"0.0",
				"setup___microstructure_coefficients___min_s_reference_value":"-1.0",
				"setup___microstructure_coefficients___min_s_weight":"0.0",
				"setup___microstructure_coefficients___max_peeq_reference_value":"-1.0",
				"setup___microstructure_coefficients___max_peeq_weight":"0.0",
				"setup___microstructure_coefficients___min_peeq_reference_value":"-1.0",
				"setup___microstructure_coefficients___min_peeq_weight":"0.0",
				"setup___nurbs_options___nurbs_degree":"1.0",
				"setup___nurbs_options___control_points_count":"1.0",
				"setup___nurbs_options___minimum_angle":"5.0",
				"setup___optimization_options___maximum_iteration":"1000.0",
				"setup___optimization_options___minimum_error":"0.1",
				"setup___optimization_options___population_count":"100.0",
				"setup___ssrve_options___cell_width":"300.0",
				"setup___ssrve_options___cell_height":"300.0",
				"analysis___shape_coefficients_weights___blair_bliss":"-1.0",
				"analysis___shape_coefficients_weights___blair_bliss_weight":"0.0",
				"analysis___shape_coefficients_weights___circular_factor_1":"-1.0",
				"analysis___shape_coefficients_weights___circular_factor_1_weight":"0.0",
				"analysis___shape_coefficients_weights___circular_factor_2":"-1.0",
				"analysis___shape_coefficients_weights___circular_factor_2_weight":"0.0",
				"analysis___shape_coefficients_weights___max_curvature":"4.9641265869140625",
				"analysis___shape_coefficients_weights___max_curvature_weight":"0.2",
				"analysis___shape_coefficients_weights___min_curvature":"-1.0",
				"analysis___shape_coefficients_weights___min_curvature_weight":"0.0",
				"analysis___shape_coefficients_weights___danielson":"-1.0",
				"analysis___shape_coefficients_weights___danielson_weight":"0.0",
				"analysis___shape_coefficients_weights___ellipse_fitting":"-1.0",
				"analysis___shape_coefficients_weights___ellipse_fitting_weight":"0.0",
				"analysis___shape_coefficients_weights___haralick":"-1.0",
				"analysis___shape_coefficients_weights___haralick_weight":"0.0",
				"analysis___shape_coefficients_weights___lp1":"-1.0",
				"analysis___shape_coefficients_weights___lp1_weight":"0.0",
				"analysis___shape_coefficients_weights___lp2":"0.8310524225234985",
				"analysis___shape_coefficients_weights___lp2_weight":"0.8",
				"analysis___shape_coefficients_weights___malinowska":"0.34325921535491943",
				"analysis___shape_coefficients_weights___malinowska_weight":"0.2",
				"analysis___shape_coefficients_weights___mz":"-1.0",
				"analysis___shape_coefficients_weights___mz_weight":"0.0"
				}
		}) ;

	#Just part of server response with fields needed for that test
	my $simulation_id = 47 ;

	my $ok_server_response = qq({
		"status":"ok",
		"simulation_id":47
		}) ;
	my $error_server_response = qq({
		"status":"error",
		"simulation_id":47
		}) ;
	my $all_sent_server_response = qq({
		"status":"all_sent",
		"simulation_id":47
		}) ;
	my $bad_id_server_response = qq({
		"status":"all_sent",
		"simulation_id":47
		}) ;

	#Parsing JSON in mock put in once place
	sub decode_response { return Mojo::JSON->new->decode($_[0])};

	my $experiment_manager_mock = Test::MockObject->new();
	$experiment_manager_mock->mock('simulation_id', sub { return $simulation_id });	
	
	#EXECUTE
	$experiment_manager_mock->mock('next_simulation', sub { return decode_response($ok_server_response) });
	my ($ok_response,$ok_sim) = Scalarm::SimulationManager::get_next_simulation($experiment_manager_mock);

	$experiment_manager_mock->mock('next_simulation', sub { return decode_response($error_server_response) });
	my ($error_response,$error_sim) = Scalarm::SimulationManager::get_next_simulation($experiment_manager_mock);

	$experiment_manager_mock->mock('next_simulation', sub { return decode_response($all_sent_server_response) });
	my ($all_sent_response,$all_sent_sim) = Scalarm::SimulationManager::get_next_simulation($experiment_manager_mock);

	$experiment_manager_mock->mock('next_simulation', sub { return decode_response($bad_id_server_response) });
	my ($bad_id_response,$bad_id_sim) = Scalarm::SimulationManager::get_next_simulation($experiment_manager_mock);

	#ASSERT
	is($ok_response,1,"Correct return for ok response");
	ok($ok_sim,"Parsed json response returned.");

	is($error_response,0,"Correct return for error response");
	ok( ! $error_sim,"Wtih error, no parsed json returned.");

	is($all_sent_response,0,"Correct return for all_sent response");
	ok( ! $all_sent_sim,"Wtih all_sent, no parsed json returned.");

	is($bad_id_response,0,"Correct return for bad_id response");
	ok( ! $bad_id_sim,"Wtih bad_id, no parsed json returned.");


}
done_testing();