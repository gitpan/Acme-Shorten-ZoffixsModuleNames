use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Acme::Shorten::ZoffixsModuleNames',
    license             => 'perl',
    dist_author         => 'Zoffix Znet <zoffix@cpan.org>',
    dist_version_from   => 'lib/Acme/Shorten/ZoffixsModuleNames.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Acme-Shorten-ZoffixsModuleNames-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
