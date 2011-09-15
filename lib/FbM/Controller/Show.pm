package FbM::Controller::Show;
use Mojo::Base 'Mojolicious::Controller';
use utf8;
use strict;
use warnings;
use v5.10;
Mojo::Loader->load('FbM::Model::Base');

# This action will render a template
sub index{
  my $self = shift;
  $self->stash(sign => 'КуКу!!', ABC=> FbM::Model::Base -> alphabet);
  $self->render;
  
}

1;
