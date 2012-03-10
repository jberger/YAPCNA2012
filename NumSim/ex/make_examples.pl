#!/usr/bin/env perl

use strict;
use warnings;

use File::chdir;
use FindBin qw/$Bin/;
use File::Spec::Functions qw/rel2abs/;

my $tdir = 'tex';
my $pdir = 'perl';

local $CWD = $Bin;

my @pfiles = do {
  local $CWD;
  push @CWD, $pdir;
  opendir( my $dh, $CWD);
  map { my $tex = $_; $tex=~s/p.$/tex/; [$tex, rel2abs $_] } 
    grep { /\.p(?:l|m)$/ } 
    readdir $dh;
};

push @CWD, $tdir;
foreach my $file (@pfiles) {
  system('pygmentize', '-o', @$file);
}

