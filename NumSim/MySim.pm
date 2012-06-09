use MooseX::RememberHistory;

use MooseX::Declare;
use Method::Signatures::Modifiers;

class MySim {

  use List::Util 'sum';

  has 'start'  => ( isa => 'Num', is => 'ro', default => 0 );
  has 'end'    => ( isa => 'Num', is => 'ro', default => 1 );
  has 'steps'  => ( isa => 'Num', is => 'ro', default => 100 );

  has 'step'   => ( isa => 'Num', is => 'ro', lazy => 1, builder => 'init_step' );
  has 'time'   => ( traits => [ 'RememberHistory' ], isa => 'Num', is => 'rw', lazy => 1, builder => 'init_time' );

  has 'things' => ( isa => 'ArrayRef[MyThing]', is => 'rw', default => sub{ [] } );
  has 'forces' => ( isa => 'ArrayRef[MyForce]', is => 'rw', default => sub{ [] } );

  method init_step () {
    my $step = ($self->end - $self->start) / $self->steps;
    return $step;
  }

  method init_time () { return $self->start }

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
}

class MyForce {

  has 'strength' => ( isa => 'Num',  is => 'rw', default => 0 );
  has 'affect'   => ( isa => 'CodeRef', is => 'ro', required => 1 );
  
}

class MyThing {

  has 'mass' => ( isa => 'Num', is => 'ro', required => 1 );
  has 'x'    => ( traits => [ 'RememberHistory' ], isa => 'Num', is => 'rw', default => 0 );
  has 'vx'   => ( traits => [ 'RememberHistory' ], isa => 'Num', is => 'rw', default => 0 );

}
