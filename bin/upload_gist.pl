#!/usr/bin/perl
use strict;
use warnings;
use utf8;

use WebService::GitHub;
use Config::Pit;
use LWP::Simple;
use Time::Piece;
use File::Slurp;
use Encode;
use File::Basename;

my $filename = $ARGV[0];
if ( !defined $filename || !-e $filename ) {
    die "invalid filename\n";
}

my $config = pit_get('github');
my $content = read_file($filename);

$filename = basename($filename);

my $gh = WebService::GitHub->new(
    token    => $config->{token},
    base_uri => $config->{uri} // 'https://github.com/api/v3',
);

$gh->post('/gists', {
    public      => "true",
    files       => {
        $filename => {
            content => decode_utf8($content),
        }
    }
});


