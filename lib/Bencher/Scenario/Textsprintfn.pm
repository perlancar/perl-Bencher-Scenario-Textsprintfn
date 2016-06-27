package Bencher::Scenario::Textsprintfn;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark Text::sprintfn vs sprintf()',
    participants => [
        {
            fcall_template => 'Text::sprintfn::sprintfn(<format>, @{<data>})',
            tags => ['sprintfn'],
        },
        {
            name => 'sprintf',
            code_template => 'sprintf(<format>, @{<data>})',
            tags => ['sprintf'],
        },
    ],
    datasets => [
        {
            args => {format => '%s', data => [1]},
        },
        {
            args => {format => '%s%d%f', data => [1,2,3]},
        },
        {
            args => {format => '%(a)s', data => [{a=>1}]},
            exclude_participant_tags => ['sprintf'],
        },
        {
            args => {format => '%(a)s%(b)d%(c)f', data => [{a=>1,b=>2,c=>3}]},
            exclude_participant_tags => ['sprintf'],
        },
    ],
};

1;
# ABSTRACT:
