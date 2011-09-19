package FbM::Controller::Show;
use strict;
use warnings;
use v5.14;
use utf8;
Mojo::Loader->load('FbM::Model::Base');
# This action will render a template


sub index{
  my ($self, $list, $menu) = shift;
  $self -> stash(
        sign => 'КуКу!!',
        ABC  => FbM::Model::Base -> alphabet,
        LIST => $list,
        MENU => $menu
        
        );
  $self -> render;
  
}

1;
