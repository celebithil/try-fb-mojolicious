package FbM::Controller::Letter;
use Mojo::Base 'Mojolicious::Controller';
use strict;
use warnings;
use v5.14;
use utf8;
Mojo::Loader->load('FbM::Model::Base');

my $LET;
sub list{
	my $self = shift;
	$LET = $self -> stash('LET');
	
	$self -> stash(
				sign => 'КуКу!!',
				ABC  => FbM::Model::Base -> alphabet,
				LIST => FbM::Model::Base -> select (&condition),
				MENU => FbM::Model::Base -> build_menu,
				condition => &condition
				
		    );
  $self -> render;

  }
  
sub condition {
return "WHERE SUBSTRING (F FROM 1 FOR 1) LIKE $LET";

}

1;
