package FbM::Model;
use DBI;
use DBD::Firebird;
use utf8;


my $dbh;
sub init {
my ($class, $config) = @_;



$self->{'dsn'} = "dbi:Firebird:db\=$self->{'dbname'};ib_dialect=3;";
        $dbh = DBI->connect (@$config{qw/dsn user password/})
          or die("Could't connect to database: $DBI:: errstr");	
	
	
}


1;
