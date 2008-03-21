#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 1;

BEGIN {
	use_ok( 'Acme::Shorten::ZoffixsModuleNames' );
}

diag( "Testing Acme::Shorten::ZoffixsModuleNames $Acme::Shorten::ZoffixsModuleNames::VERSION, Perl $], $^X" );
