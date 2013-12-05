#! /usr/bin/perl -w

use 5.012; # implies "use strict;"
use warnings;
use autodie;
use Scalarm::Runner;

my $runner = Scalarm::Runner->new(config_file_path => $ARGV[0]);
$runner->run();

