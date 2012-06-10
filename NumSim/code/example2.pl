my $sim = MySim->new(
  end => 5,
  things => [ $thing ],
  forces => [ $acc, $dec ],
);

$sim->run;

my $time = pdl $sim->time_history;
my $x    = pdl $thing->x_history;

line_plot($time, $x);

