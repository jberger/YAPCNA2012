class MyThing {

  has 'mass' => ( isa => 'Num', is => 'ro', required => 1 );
  has 'x'    => ( isa => 'Num', is => 'rw', default => 0 );
  has 'vx'   => ( isa => 'Num', is => 'rw', default => 0 );

  method state () {
    return $self->x(), $self->vx();
  }

}
