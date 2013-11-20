#! /usr/bin/perl -w
 
use Test::More ;
use Test::MockObject;

BEGIN { use_ok('Scalarm::InformationService') }
 
TODO: {
        #can_ok( 'ProjectEuler::Problem1','process');
        # OR ok( ProjectEuler::Problem1::can('process') , "ProjectEuler Problem 1 can execute the process command." );
}

done_testing();