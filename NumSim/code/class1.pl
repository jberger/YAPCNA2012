class MySim {
  use List::Util 'sum';

  has 'start'  => ( isa => 'Num', is => 'ro', default => 0 );
  has 'end'    => ( isa => 'Num', is => 'ro', default => 1 );
  has 'steps'  => ( isa => 'Num', is => 'ro', default => 100 );

  has 'step'   => ( isa => 'Num', is => 'ro', lazy => 1, builder => 'init_step');
  has 'time'   => ( traits => [ 'RememberHistory' ], isa => 'Num', is => 'rw', 
                    lazy => 1, builder => 'init_time' );

  has 'things' => ( isa => 'ArrayRef[MyThing]', is => 'rw', default => sub{[]} );
  has 'forces' => ( isa => 'ArrayRef[MyForce]', is => 'rw', default => sub{[]} );

  method init_step () {
    my $step = ($self->end - $self->start) / $self->steps;
    return $step;
  }

  method init_time () { return $self->start }
