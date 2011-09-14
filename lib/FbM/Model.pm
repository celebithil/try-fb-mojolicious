package FbM::Model;
use DBI;
use DBD::Firebird;



my $dbh;
sub init {
my ($class, $config) = @_;

$dbh = DBI->connect (@$config{qw/dsn user password/});	
	
	
}


1;
