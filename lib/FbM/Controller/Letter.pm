package FbM::Controller::Letter;
use Mojo::Base 'Mojolicious::Controller';
use v5.14;
use utf8;
Mojo::Loader->load('FbM::Model::Base');

sub list{
	my $self = shift;
	my $LET = $self -> stash( 'LET' );
	my $query = " SELECT FIRST ? SKIP ?
				       	ID, F, N, P, ADR,
               		CAST(lpad(EXTRACT(DAY FROM BIRTHDATE),2,'0') AS varchar(2))||'.'||
               		CAST(lpad(EXTRACT(MONTH FROM BIRTHDATE),2,'0') AS varchar(2))||'.'||
               		EXTRACT(YEAR FROM BIRTHDATE) AS BIRTHDATE 
               		FROM MAIN WHERE SUBSTRING (F FROM 1 FOR 1) LIKE '$LET'
	 						ORDER BY F COLLATE UNICODE, N COLLATE UNICODE, P COLLATE UNICODE";	
		
	$self -> stash(
				sign => 'КуКу!!',
				ABC  => FbM::Model::Base -> alphabet,
				LIST => FbM::Model::Base -> select( \$query ),
				MENU => FbM::Model::Base -> build_menu,
		    );
  $self -> render;
  }
  

1;
