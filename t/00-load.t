#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 4;

BEGIN {
    use_ok( 'Scalarm::SimulationManager' ) || print "Bail out!\n";
    use_ok( 'Scalarm::InformationService' ) || print "Bail out!\n";
    use_ok( 'Scalarm::ExperimentManager' ) || print "Bail out!\n";
    use_ok( 'Scalarm::StorageManager' ) || print "Bail out!\n";
}

diag( "Testing Scalarm::SimulationManager $Scalarm::SimulationManager::VERSION, Perl $], $^X" );
