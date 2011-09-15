package FbM::Model::Base;
use strict;
use warnings;
use v5.14;
use base qw/Mojo::Base/;



sub alphabet {
  my $class = shift;
  my $sth = FbM::Model->dbh->prepare("SELECT DISTINCT SUBSTRING (F FROM 1 FOR 1) AS SUB FROM MAIN ORDER BY F");
  $sth->execute;
  my $alphabet = $sth->fetchall_arrayref( {} );
  return $alphabet;
}

1;
__END__
