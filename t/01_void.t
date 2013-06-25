use strict;
use lib qw(blib);
use Test::More;
use Acme::Void;

eval { void };
ok( ! $@, "call" );

eval { void &foo };
ok( ! $@, "call" );

my $foo;
eval { $foo = void };
ok( ! $@, "call" );

eval { void __PACKAGE__->foo };
ok( ! $@, "call" );

eval { void = __PACKAGE__->foo };
ok( ! $@, "call" );

sub foo { 1 }

done_testing;

__END__