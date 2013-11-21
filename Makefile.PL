use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Scalarm::SimulationManager',
    AUTHOR           => q{Michal Orzechowski <morzch@agh.edu.pl>},
    VERSION_FROM     => 'lib/Scalarm/SimulationManager.pm',
    ABSTRACT_FROM    => 'lib/Scalarm/SimulationManager.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
        'File::Temp' => 0,
        'File::Copy' => 0,
        'Test::MockObject' => 0,
        'Log::Log4perl' => 0
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Scalarm-SimulationManager-*' },
);
