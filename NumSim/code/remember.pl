use MooseX::Declare;
use Method::Signatures::Modifiers;
use MooseX::RememberHistory;

class MyClass {
  has 'x' => ( 
    traits => ['RememberHistory'], 
    isa => 'Num', is => 'rw',
    default => 0
  );
}

my $obj = MyClass->new;
$obj->x( 1 );
$obj->x( 2 );

print join ', ', @{ $obj->x_history };
# 0, 1, 2
