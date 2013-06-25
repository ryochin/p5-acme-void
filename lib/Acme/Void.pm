#

package Acme::Void;

use strict;
use 5.006;
use vars qw($VERSION);
use base qw(Class::BlackHole);
use warnings;
no  warnings "redefine";
use Want;

# ABSTRACT: Making void things more void

$VERSION = '0.03';

sub import {
    my $class = shift;
    my $pkg = caller(0);

    my @void = qw(void);
    push @void, qw(empty nil noop nothing null pass)
	if scalar grep { $_ eq ':all' } @_;

    no strict 'refs';    ## no critic
    for(@void){
	*{$pkg . "::$_"} = sub :lvalue {
	    lnoreturn
		if want qw(LVALUE ASSIGN);
	    return my $self = bless \ my $scalar, $class
		if want qw(OBJECT LVALUE);
	    return;
	};
    }
}

1;

__END__

=encoding utf-8

=head1 NAME

Acme::Void - Making void things more void

=head1 SYNOPSIS

 use Acme::Void;

 # showing explicitly it's under void context.
 void do_something();
 void $self->bark;

 # or a bit more explicitly.
 void = do_something();
 void = $self->bark;

 # you can use it just like an alternative to built-in 'undef'.
 my $str = void;

 # void yields void.
 void->foo;    # always void


 use Acme::Void qw(:all);

 # you might like other languages.
 my $foo = nil;
 my $bar = null;

 # with broken love...
 if( our $love eq nothing ){
    my @heart = empty ;;
 }

 # no operations here.
 noop;

 # or OOP!
 sub meet_a_cute_girl {
    my $self = shift;
    $self->noop;    # no way!
 }

 # the equality.
 void = empty = nil = noop = nothing = null = undef;
 void = void->void;

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

=back

=head1 DEPENDENCY

Want, Class::BlackHole

=head1 SEE ALSO

Acme::Boolean

=head1 REPOSITORY

https://github.com/ryochin/p5-acme-void

=head1 AUTHOR

Ryo Okamoto E<lt>ryo@aquahill.netE<gt>

=head1 COPYRIGHT & LICENSE

Copyright (c) Ryo Okamoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut