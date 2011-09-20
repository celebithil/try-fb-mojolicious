package FbM::Model::Base;
use strict;
use warnings;
use v5.14;
use utf8;
use Encode qw /decode/;
use base qw/Mojo::Base/;
use Data::Pageset;

my $sth;
my $page_info;
my $sql;
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
    my ( $class, $condition_of_select) = shift;
    my @bind_values;
	$page_info = &page_parameters;
	$sql = $condition_of_select;
	
	
	
	
	
	
	
	$sth = FbM::Model->dbh->prepare(
    
        "SELECT FIRST ? SKIP ?
				ID, F, N, P, ADR,
               CAST(lpad(EXTRACT(DAY FROM BIRTHDATE),2,'0') AS varchar(2))||'.'||
               CAST(lpad(EXTRACT(MONTH FROM BIRTHDATE),2,'0') AS varchar(2))||'.'||
               EXTRACT(YEAR FROM BIRTHDATE) AS BIRTHDATE 
               FROM MAIN WHERE SUBSTRING (F FROM 1 FOR 1) LIKE 'Ф'
				ORDER BY F COLLATE UNICODE, N COLLATE UNICODE, P COLLATE UNICODE"
    );
    push @bind_values, $page_info->entries_per_page, $page_info->first - 1;
	$sth->execute(@bind_values);
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

sub page_parameters{
	my ( $class, @bind_values ) = shift;
	my $page_number = 1; #temporary!!!!
	my @total_entries = FbM::Model->dbh->selectrow_array("SELECT COUNT(*) FROM MAIN", undef, @bind_values);
	my $page_info = Data::Pageset->new(
            {
                'total_entries'    => @total_entries,
                'entries_per_page' => 20,
                'current_page'     => $page_number,
                'pages_per_set'    => 10,
                'mode'             => 'slide',                  # default fixed
            }
        );
	
}

sub build_menu{
	my $menu = $page_info->pages_in_set;

}

sub sql{ return $sql};

1;
__END__
