#!/usr/bin/env perl

use strict;
use warnings;

use lib '../lib';

use Acme::Shorten::ZoffixsModuleNames qw(ABE CPANLTD);

my $baby = ABE->new;

$baby->eat(2);

my $cpan_links_to_docs = CPANLTD->new;

print "$_\n" for @{ $cpan_links_to_docs->link_for('RE,REF,map') };