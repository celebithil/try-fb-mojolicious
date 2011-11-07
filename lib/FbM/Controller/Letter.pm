package FbM::Controller::Letter;
use Mojo::Base 'Mojolicious::Controller';
use v5.14;
use utf8;
Mojo::Loader->load('FbM::Model::Base');

sub list{
	my $self = shift;
	my $LET = $self -> stash('LET');
	
	$self -> stash(
				sign => 'КуКу!!',
				ABC  => FbM::Model::Base -> alphabet,
				LIST => FbM::Model::Base -> select("$LET"),
				MENU => FbM::Model::Base -> build_menu,
		    );
  $self -> render;
  }
  

1;
