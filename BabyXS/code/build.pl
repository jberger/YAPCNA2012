use strict;
use warnings;

use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'MyModule',
    dist_author       => 'Joel Berger',
    license           => 'perl',
    configure_requires => {
      'Module::Build' => 0.38,
    },
    build_requires    => {
      'ExtUtils::CBuilder' => 0,
    },    
    extra_linker_flags => '-lsomelib',
);

$builder->create_build_script;
