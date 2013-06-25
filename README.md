# NAME

Acme::Void - Making void things more void

# SYNOPSIS

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

# DESCRIPTION

You must need 'void' and other void-ish functions to write
cool codes.

# FUNCTIONS

- __void__

    Just provides the 'void way'.

- __empty__, __nil__, __noop__, __nothing__, __null__

    Synonyms to __void__. To import them, don't forget to use the module
    with ':all' switch.

# DEPENDENCY

Want, Class::BlackHole

# SEE ALSO

Acme::Boolean

# REPOSITORY

https://github.com/ryochin/p5-acme-void

# AUTHOR

Ryo Okamoto <ryo@aquahill.net>

# COPYRIGHT & LICENSE

Copyright (c) Ryo Okamoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
