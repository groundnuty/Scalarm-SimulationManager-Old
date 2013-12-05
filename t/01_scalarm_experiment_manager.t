#! /usr/bin/perl -w
 
use strict;
use warnings;
use Test::More ;

use Mock::Quick;
use Mojo::Log;

my $devel_skip_reason = 'When we develop a test we want execute just that test :)' ;
my $devel_skip_falg = 1 ;

use Log::Log4perl qw(:easy);
my $log_conf = "log4perl.conf";
Log::Log4perl->init($log_conf);

use File::Temp qw/ tempfile tempdir /;
BEGIN { use_ok('Scalarm::ExperimentManager') }

my $em_class = qtakeover( 'Scalarm::ExperimentManager' );

{

	use File::Copy qw(copy);
	
	use Test::MockObject;
	use Mojo::JSON;
	#PREPARE
	can_ok('Scalarm::ExperimentManager','get_simulation');

	my $server_response = qq({
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
	my $simulation_id = 12 ;

	
	#PREPARE
	#stage test dir and test code_base archive
	my $test_tempdir = File::Temp->newdir(CLEANUP => 0);
	diag($test_tempdir);
	my $test_file_name = "test_code_base";
	my $source = "t/resources/$test_file_name".'.zip';
	my $destination = "$test_tempdir/$test_file_name".'.zip';
	copy($source,$destination) or die "Copy failed: $!" ;

	#override so stage code_base is returned
	$em_class->override( _download_experiment => sub { return $destination });
	$em_class->override( _get_simulation => sub { return $server_response  });
	
	#EXECUTE
	my ($experiment_id,$root,$code_base_name) = (1,$test_tempdir."/",$test_file_name);
	my $em = $em_class->new(experiment_id => $experiment_id,root=>$root,code_base_name=>$code_base_name) ; 



	#Parsing JSON in mock put in once place
	#sub decode_response { return Mojo::JSON->new->decode($_[0])};

	$em->get_experiment();
	my ($er,$sim) = $em->get_simulation();
	$sim->run();

	#$test_tempdir->unlink_on_destroy(1);

}

SKIP: {
	skip $devel_skip_reason, 0 if $devel_skip_falg ;
	use Test::MockObject;
	use Mojo::JSON;
	#PREPARE
	can_ok('Scalarm::ExperimentManager','get_simulation');

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
		"simulation_id":47,
		"execution_constraints": {"time_contraint_in_sec":3600},
		"input_parameters": {
				"setup___microstructure_coefficients___volume_fraction_reference_value":"0.44972270447530865"
			}
		}) ;
	my $error_server_response = qq({
		"status":"error",
		"simulation_id":47,
		"execution_constraints": {"time_contraint_in_sec":3600},
		"input_parameters": {
				"setup___microstructure_coefficients___volume_fraction_reference_value":"0.44972270447530865"
			}
		}) ;
	my $all_sent_server_response = qq({
		"status":"all_sent",
		"simulation_id":47,
		"execution_constraints": {"time_contraint_in_sec":3600},
		"input_parameters": {
				"setup___microstructure_coefficients___volume_fraction_reference_value":"0.44972270447530865"
			}
		}) ;
	my $bad_id_server_response = qq({
		"status":"all_sent",
		"simulation_id":47,
		"execution_constraints": {"time_contraint_in_sec":3600},
		"input_parameters": {
				"setup___microstructure_coefficients___volume_fraction_reference_value":"0.44972270447530865"
			}
		}) ;

	#Parsing JSON in mock put in once place
	#sub decode_response { return Mojo::JSON->new->decode($_[0])};

	my $experiment_manager_mock = Test::MockObject->new();
	$experiment_manager_mock->mock('simulation_id', sub { return $simulation_id });	
	
	#EXECUTE
	$em_class->override( _get_simulation => sub { return $ok_server_response });
	my ($ok_response,$ok_sim) = $em_class->new(experiment_id=>1)->get_simulation();

	$em_class->override( _get_simulation => sub { return $error_server_response});
	my ($error_response,$error_sim) =  $em_class->new(experiment_id=>1)->get_simulation();

	$em_class->override( _get_simulation => sub { return $all_sent_server_response });
	my ($all_sent_response,$all_sent_sim) =  $em_class->new(experiment_id=>1)->get_simulation();

	$em_class->override( _get_simulation => sub { return $bad_id_server_response});
	my ($bad_id_response,$bad_id_sim) =  $em_class->new(experiment_id=>1)->get_simulation();

	#ASSERT
	is($ok_response,1,"Correct return for ok response");
	ok($ok_sim,"Parsed json response returned.");
	is($ok_sim->simulation_id,47,"Correct id of simulation object");
	ok($ok_sim->execution_constraints,"Execution constraints set");
	ok($ok_sim->input_parameters,"input_parameters constraints set");

	is($error_response,0,"Correct return for error response");
	ok( ! $error_sim,"Wtih error, no parsed json returned.");

	is($all_sent_response,0,"Correct return for all_sent response");
	ok( ! $all_sent_sim,"Wtih all_sent, no parsed json returned.");

	is($bad_id_response,0,"Correct return for bad_id response");
	ok( ! $bad_id_sim,"Wtih bad_id, no parsed json returned.");



}

 
SKIP: {
	skip $devel_skip_reason, 0 if $devel_skip_falg ;
	use File::Temp qw/ tempfile tempdir /;

	#PREPARE	
	can_ok('Scalarm::ExperimentManager','load_config');
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
 	my $result = Scalarm::ExperimentManager::load_config($file);
 	
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
		use File::Copy qw(copy);
		
		#PREPARE
		#stage test dir and test code_base archive
		my $test_tempdir = File::Temp->newdir();
		
		my $test_file_name = "test_code_base";
		my $source = "t/resources/$test_file_name".'.zip';
		my $destination = "$test_tempdir/$test_file_name".'.zip';
		copy($source,$destination) or die "Copy failed: $!" ;

		#Code base file is expected to contain into:
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

		#override so stage code_base is returned
		$em_class->override( _download_experiment => sub { return $destination });
		
		#EXECUTE
		my ($experiment_id,$root,$code_base_name) = (1,$test_tempdir,$test_file_name);
		my $em = $em_class->new(experiment_id => $experiment_id,root=>$root,code_base_name=>$code_base_name) ; 


		#ASSERT
		is($em->experiment_id,1,"experiment id was set");
		ok(!$em->does_experiment_exist(),"experiment directory does not exist");

		is($em->get_experiment_dir,$root."experiment_".$experiment_id."/",'experiment dir path generated');
		is($em->get_code_base_dir,$root."experiment_".$experiment_id."/".$code_base_name."/",'code base dir path generated');

		#EXECUTE
		$em->create_experiment_dir();
		my $path = $em->_download_experiment();
		
		#ASSERT
		ok($em->does_experiment_exist(),"experiment directory does exist");
		is($path,$destination,'downloaded code based path mocked correctly');

		#EXECUTE
		$em->_extract_experiment($path);


		#ASSERT
		ok(-e -d $em->get_code_base_dir(), "Check if 'code base' directory was created.");
		ok(-e -f $em->get_code_base_dir()."/".$files[0], "File '$files[0]' was extracted.");
		ok(-e -f $em->get_code_base_dir()."/".$files[1], "Check if file '$files[1]' was extracted.");
		ok(-e -f $em->get_code_base_dir()."/".$files[2], "Check if file '$files[2]' was extracted.");
		ok(-e -f $em->get_code_base_dir()."/".$files[3], "Check if file '$files[3]' was extracted.");
		ok(-e -f $em->get_code_base_dir()."/".$files[4], "Check if file '$files[4]' was extracted.");

		ok(-e -d $em->get_code_base_dir()."/".$sfiles[0], "Check if directory '$sfiles[0]' was created.");


		#EXECUTE 
		$em->_change_permissions();

		#ASSERT

		#TODO: Those tests only cover users permissions not group nor all
		ok(-r -w -x $em->get_code_base_dir().$files[0], "File '$files[0]' has permissions set.");
		ok(-r -w -x $em->get_code_base_dir().$files[1], "File '$files[1]' has permissions set.");
		ok(-r -w -x  $em->get_code_base_dir().$files[2], "File '$files[2]' has permissions set.");
		ok(-r -w -x  $em->get_code_base_dir().$files[3], "File '$files[3]' has permissions set.");
		ok(-r -w -x  $em->get_code_base_dir().$files[4], "File '$files[4]' has permissions set.");

		ok(-e -r -w -x $em->get_code_base_dir().$sfiles[0], "Directory '$sfiles[0]' was created.");

		#CLEANUP
		$em_class->restore( '_download_experiment');
        
}

done_testing();