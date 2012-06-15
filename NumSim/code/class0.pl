use MooseX::RememberHistory;
use MooseX::Declare;
use Method::Signatures::Modifiers;

class MyForce {
  has 'strength' => ( isa => 'Num',  is => 'rw', default => 0 );
  has 'affect'   => ( isa => 'CodeRef', is => 'ro', required => 1 ); 
}

class MyThing {
  has 'mass' => ( isa => 'Num', is => 'ro', required => 1 );
  has 'x'    => ( traits => [ 'RememberHistory' ], isa => 'Num', 
                  is => 'rw', default => 0 );
  has 'vx'   => ( traits => [ 'RememberHistory' ], isa => 'Num',
                  is => 'rw', default => 0 );
}
