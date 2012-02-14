#!/usr/bin/env perl

use strict;
use warnings;

use MySim;
use Data::Dumper;
use PDL;

my $thing = MyThing->new(
  mass => 2,
);

my $force = MyForce->new(
  strength => 1,
  affect => sub {
    my ($self, $thing, $sim) = @_;
    return $self->strength;
  },
);

my $short_force = MyForce->new(
  strength => 1,
  affect => sub {
    my ($self, $thing, $sim) = @_;
    return 0 if ($thing->x > 0.1);
    return $self->strength;
  },
);

my $sim = MySim->new(
  things => [ $thing ],
  forces => [ $force, $short_force ],
);

$sim->run;

my $pdl = pdl $sim->log->{$thing};

print $pdl;
