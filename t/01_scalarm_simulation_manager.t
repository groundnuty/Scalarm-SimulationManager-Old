#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More ;

BEGIN {
	use_ok('Scalarm::SimulationManager')

}
 
{
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


{
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
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[0], "Check if file '$files[0]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[1], "Check if file '$files[1]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[2], "Check if file '$files[2]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[3], "Check if file '$files[3]' was extracted.");
		ok(-e -f $experiment_manager_mock->code_base_dir."/".$files[4], "Check if file '$files[4]' was extracted.");

		ok(-e -d $experiment_manager_mock->code_base_dir."/".$sfiles[0], "Check if directory '$sfiles[0]' was created.");

		#TODO: Those tests only cover users permissions not group nor all
		ok(-r -w -x $experiment_manager_mock->code_base_dir."/".$files[0], "Check if file '$files[0]' has permissions set.");
		ok(-r -w -x $experiment_manager_mock->code_base_dir."/".$files[1], "Check if file '$files[1]' has permissions set.");
		ok(-r -w -x  $experiment_manager_mock->code_base_dir."/".$files[2], "Check if file '$files[2]' has permissions set.");
		ok(-r -w -x  $experiment_manager_mock->code_base_dir."/".$files[3], "Check if file '$files[3]' has permissions set.");
		ok(-r -w -x  $experiment_manager_mock->code_base_dir."/".$files[4], "Check if file '$files[4]' has permissions set.");

		ok(-e -r -w -x $experiment_manager_mock->code_base_dir."/".$sfiles[0], "Check if directory '$sfiles[0]' was created.");


}


done_testing();