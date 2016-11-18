requires 'Config::Pit';
requires 'Encode';
requires 'File::Slurp';
requires 'LWP::Simple';
requires 'Time::Piece';
requires 'WebService::GitHub';
requires 'perl', '5.008001';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
};

on test => sub {
    requires 'Test::More', '0.98';
};
