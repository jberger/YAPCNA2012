package MyModule;

use strict; use warnings;
our $VERSION = '0.01';

require XSLoader;
XSLoader::load();

sub myfunc {
  my @args = @_;
  my $ret = c_func(@args);
  return wantarray ? @$ret : $ret->[0];
}

