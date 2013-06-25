use strict;
use lib qw(blib);
use Test::More;
use Acme::Void;

eval { void void void };
ok( ! $@, "chain call" );

eval { void = void = void };
ok( ! $@, "chain call" );

done_testing;

__END__