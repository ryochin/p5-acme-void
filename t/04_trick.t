#
# $Id$

use strict;
use lib qw(blib);
use Test::More tests => 2;
use Acme::Void;

eval { void void void };
ok( ! $@, "chain call" );

eval { void = void = void };
ok( ! $@, "chain call" );

