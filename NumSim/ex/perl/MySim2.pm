  method init_step () {
    my $step = ($self->end - $self->start) / $self->steps;
    return $step;
  }

  method init_time () { return $self->start }

  method record ( MyThing $thing ) {
    push @{ $self->log->{$thing . ''} }, [ $self->time, $thing->state ];
  }

  method evolve ( MyThing $thing ) {
    my $dt = $self->step;
    my $vx = $thing->vx;

    my $force = sum map { $_->affect->($_, $thing, $self) } @{ $self->forces };
    my $acc = $force / ($thing->mass);

    $thing->vx( $vx + $acc * $dt );
    $thing->x( $thing->x + $vx * $dt );

    $self->record( $thing );
  }

  method run () {
    $self->record( $_ ) for @{ $self->things };
    $self->time( $self->time + $self->step );

    while ($self->time < $self->end) {
      $self->evolve( $_ ) for @{ $self->things };
      $self->time( $self->time + $self->step );
    }
  }
}
