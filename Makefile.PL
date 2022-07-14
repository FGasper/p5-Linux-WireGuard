use strict;
use warnings;

use ExtUtils::MakeMaker::CPANfile;

WriteMakefile(
    NAME              => 'Linux::Wireguard',
    VERSION_FROM      => 'lib/Linux/Wireguard.pm', # finds $VERSION
    ABSTRACT_FROM  => 'lib/Linux/Wireguard.pm', # retrieve abstract from module
    AUTHOR         => [
        'Felipe Gasper (FELIPE)',
    ],

    LICENSE => "perl_5",

    INC => join(
        q< >,
        "-Iwirwguard.h",
        '-Wall',
        '-std=c99',
    ),

    OBJECT => join(
        q< >,
        '$(BASEEXT)$(OBJ_EXT)',
        'libwireguard.o',
    ),

    PMLIBDIRS => ['lib'],

    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url => 'git://github.com/FGasper/p5-Wasm-Wasm3.git',
                web => 'https://github.com/FGasper/p5-Wasm-Wasm3',
            },
            bugtracker => {
                web => 'https://github.com/FGasper/p5-Wasm-Wasm3/issues',
            },
        },
    },
);
