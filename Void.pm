#
# $Id$
#

package Acme::Void;

use strict;
use 5.006;
use vars qw($VERSION);
use warnings;
use Want;

$VERSION = '0.01';

sub import {
    my $class = shift;
    my $pkg = caller(0);

    my @void = qw(void);
    push @void, qw(empty nil noop nothing null)
	if scalar grep { $_ eq ':all' } @_;

    no strict 'refs';
    for(@void){
	*{$pkg . "::$_"} = sub :lvalue {
	    lnoreturn
		if want('LVALUE');
	    return;
	};
    }
}

1;

__END__

=pod

=head1 NAME

Acme::Void - Making void things more void

=head1 SYNOPSIS

 use Acme::Void;

 # showing explicitly it's under void context.
 void = do_something();

 # you can use it just as an alternative to built-in 'undef'.
 my $str = void;


 use Acme::Void qw(:all);

 # you might like other languages.
 my $foo = nil;
 my $bar = null;

 # with broken love...
 if( $your_love eq nothing ){ 
    my @heart = empty;
 }

 # no operations here.
 noop;

 # or OOP!
 sub meet_a_cute_girl {
    my $self = shift;
    $self->noop;    # no way!
 }

=head1 DESCRIPTION

You must need 'void' and other void-ish functions to write
cool codes.

=head1 FUNCTIONS

=over 4

=item B<void>

Just provides the 'void way'.

=item B<empty>, B<nil>, B<noop>, B<nothing>, B<null>

Synonyms to B<void>. To import them, don't forget to use the module
with ':all' switch.

=head1 DEPENDENCY

Want

=head1 AUTHOR

Okamoto RYO <ryo@aquahill.net>

=cut

