use strict;
use lib qw(blib);
use Test::More;
use Acme::Void;

eval { void->foo };
ok( ! $@, "object call" );

eval { void->void };
ok( ! $@, "object call" );

eval { void()->foo };
ok( ! $@, "object call" );

eval { void void->void };
ok( ! $@, "object call void content" );

eval { void = void->void };
ok( ! $@, "object call eq content" );

sub foo { 1 }

done_testing;

__END__