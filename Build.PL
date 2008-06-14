#
# $Id$

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Acme::Void',
    license             => 'perl',
    dist_author         => 'Ryo Okamoto <ryo at aquahill dot net>',
    dist_version_from   => 'lib/Acme/Void.pm',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
	'Want' => 0,
	'Class::BlackHole' => 0,
    },
    add_to_cleanup      => [ 'Acme-Void-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
