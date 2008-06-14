#
# $Id$

package __test;

use strict;
use Acme::Void;

sub new {
    return bless \my $self, shift;
}

sub run {
    my $self = shift;
    $self->void;
}

package main;

use strict;
use lib qw(blib);
use Test::More tests => 1;

my $obj = __test->new;
eval { $obj->run };
ok( ! $@, "method call" );

