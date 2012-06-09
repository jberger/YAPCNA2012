  method evolve ( MyThing $thing ) {
    my $dt = $self->step;
    my $vx = $thing->vx;

    my $force = sum map { $_->affect->($_, $thing) } @{ $self->forces };
    my $acc = $force / ($thing->mass);

    $thing->vx( $vx + $acc * $dt );
    $thing->x( $thing->x + $vx * $dt );
  }

  method run () {
    while ($self->time < $self->end) {
      $self->evolve( $_ ) for @{ $self->things };
      $self->time( $self->time + $self->step );
    }
  }
} # end of class MySim
