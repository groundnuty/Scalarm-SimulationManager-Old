#!/bin/bash

PERL5LIB=$PERL5LIB:./lib:./exlib
#PERL5LIB=$PERL5LIB:./lib/Mojo

perl bin/run.pl config.json

#echo $PERL5LIB
