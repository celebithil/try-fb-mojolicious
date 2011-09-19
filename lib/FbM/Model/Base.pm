package FbM::Model::Base;
use strict;
use warnings;
use v5.14;
use utf8;
use Encode qw /decode/;
use base qw/Mojo::Base/;
my $sth;

sub alphabet {
    my $class = shift;
    $sth = FbM::Model->dbh->prepare(
        "SELECT DISTINCT SUBSTRING (F FROM 1 FOR 1) AS SUB FROM MAIN ORDER BY F"
    );
    $sth->execute;
    my @alphabet =
      map { { SUB => decode( 'utf8', $_->{SUB} ) } }
      @{ $sth->fetchall_arrayref( {} ) };
    return \@alphabet;
}

sub select {
    my ( $class, $condition ) = shift;
    $sth = FbM::Model->dbh->prepare(
        "SELECT ID, F, N, P, ADR,
                CAST(lpad(EXTRACT(DAY FROM BIRTHDATE),2,'0') AS varchar(2))||'.'||
                CAST(lpad(EXTRACT(MONTH FROM BIRTHDATE),2,'0') AS varchar(2))||'.'||
                EXTRACT(YEAR FROM BIRTHDATE) AS BIRTHDATE
                FROM MAIN ORDER BY F COLLATE UNICODE, N COLLATE UNICODE, P COLLATE UNICODE"
    );
    $sth->execute;
    my @list =
      map { 
			{ 	ID => $_->{ID},
				F => decode( 'utf8', $_->{F} ),
				N => decode( 'utf8', $_->{N} ),
				P => decode( 'utf8', $_->{P} ),
				ADR => decode( 'utf8', $_->{ADR} ),
				BIRTHDATE => decode( 'utf8', $_->{BIRTHDATE} )
				
      
			} 
		  }
      @{ $sth->fetchall_arrayref( {} ) };
    return \@list;
}

1;
__END__
