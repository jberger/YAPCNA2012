#!/usr/bin/env perl
use strict; use warnings;
use MySim;
use PDL;
use PDL::Graphics::Prima::Simple;

my $thing = MyThing->new( mass => 2 );

my $acc = MyForce->new(
  strength => 2,
  affect => sub {shift->strength},
);

my $dec = MyForce->new(
  strength => -30,
  affect => sub {
    my ($self, $thing) = @_;
    return 0 if ($thing->x < 0.1);
    return $self->strength;
  },
);

