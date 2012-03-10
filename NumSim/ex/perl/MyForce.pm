class MyForce {

  has 'strength' => ( isa => 'Num',  is => 'rw', default => 0 );
  has 'affect'   => ( isa => 'CodeRef', is => 'ro', required => 1 );
  
}
