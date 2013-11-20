#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More ;
use Test::MockObject;

BEGIN {
	use_ok('Scalarm::SimulationManager')

}
 
{
	#PREPARE
	use Test::TempDir;
	can_ok('Scalarm::SimulationManager','load_config');
	my $test_tempdir = temp_root();
	
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


{
		#PREPARE
		use File::Copy;
		use Test::TempDir;
		can_ok('Scalarm::SimulationManager','get_experiment_repository');

		my $test_tempdir = temp_root();
		diag($test_tempdir);
		my $test_file_name = "test_code_base.zip";
		my $source = "./t/resouces/$test_file_name";
		my $destination = "$test_tempdir/$test_file_name";
		copy($source ,$destination) ;


		my $experiment_manager_mock = Test::MockObject->new();
		$experiment_manager_mock ->mock('download_code_base', sub { return $destination });

		#TODO nie podoba mi sie zahardocowane code_base
		$experiment_manager_mock ->mock('code_base_dir', sub { return "$test_tempdir/code_base_dir"});

		#EXECUTE
		Scalarm::SimulationManager::get_experiment_repository($experiment_manager_mock);

		#ASSERT
}


done_testing();