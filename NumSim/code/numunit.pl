use MooseX::Declare;
use Method::Signatures::Modifiers;

class SphericalCow {
  use MooseX::Types::NumUnit qw/num_of_unit/;
  has 'radius'   => ( isa => num_of_unit('m'),   is => 'rw', default => 1 );
  has 'velocity' => ( isa => num_of_unit('m/s'), is => 'rw', default => 0 );
}

use strict; use warnings;

my $cow = SphericalCow->new(
  radius => '1 ft',
);

print $cow->radius . "\n"; # 0.3048

