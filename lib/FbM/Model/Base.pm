package FbM::Model::Base;
use strict;
use warnings;
use v5.14;
use utf8;
use Encode qw /decode/;
use base qw/Mojo::Base/;
sub alphabet {
  my $class = shift;
  my $sth = FbM::Model->dbh->prepare("SELECT DISTINCT SUBSTRING (F FROM 1 FOR 1) AS SUB FROM MAIN ORDER BY F");
  $sth->execute;
  my @alphabet = map {{SUB => decode('utf8', $_->{SUB})}} @{$sth->fetchall_arrayref( {} )};
  return \@alphabet;
}

1;
__END__
