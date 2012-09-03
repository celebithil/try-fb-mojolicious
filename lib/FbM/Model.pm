package FbM::Model;
use strict;
use warnings;
use DBI;
use DBD::Firebird;
use Carp qw /croak/;
my $dbh;

use Mojo::Loader;
# Reloadable Model
my $modules = Mojo::Loader->search('FbM::Model');
for my $module (@$modules) {
    Mojo::Loader->load($module)
}

sub init {
my ($class, $config) = @_;
croak "No dsn was passed!" unless $config && $config->{dsn};
$dbh = DBI->connect (@$config{qw/dsn user password/}) or die DBI->error;	
}

sub dbh {
    return $dbh if $dbh;
    croak "You should init model first!";
}


1;
