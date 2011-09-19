package FbM::Controller::All;
use Mojo::Base 'Mojolicious::Controller';
use strict;
use warnings;
use v5.14;
use utf8;
Mojo::Loader->load('FbM::Model::Base');

sub list{
	my $self = shift;
	$self -> stash(
				sign => 'КуКу!!',
				ABC  => FbM::Model::Base -> alphabet,
				LIST => FbM::Model::Base -> select,
				MENU => FbM::Model::Base -> build_menu
				
		    );
  $self -> render;

  }

1;
