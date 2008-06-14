#
# $Id$

use strict;
use lib qw(blib);
use Test::More tests => 1;
use Acme::Void qw(:all);

eval {

    void;
    void foo();
    void = foo();

    void __PACKAGE__->foo;
    void = __PACKAGE__->foo;

    void->foo;
    void->void;

    my $foo = void;
    my @bar = void;

    void = empty = nil = noop = nothing = null = undef;
    void empty nil noop nothing null undef;

    __PACKAGE__->bar;
};
ok( ! $@, "sample code" );

sub foo { 1 };

sub bar {
    my $class = shift;
    $class->void;
    void = main->foo;
    return void;
}

