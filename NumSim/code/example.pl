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
  strength => -50,
  affect => sub {
    my ($self, $thing) = @_;
    return 0 if ($thing->x < 0.1);
    return $self->strength;
  },
);

my $sim = MySim->new(
  end => 5,
  things => [ $thing ],
  forces => [ $acc, $dec ],
);

$sim->run;

my $time = pdl $sim->time_history;
my $x    = pdl $thing->x_history;

line_plot($time, $x);

