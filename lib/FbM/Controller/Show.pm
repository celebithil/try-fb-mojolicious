package FbM::Controller::Show;
use Mojo::Base 'Mojolicious::Controller';
use utf8;
use strict;
use warnings;
use v5.10;


# This action will render a template
sub index{
  my $self = shift;
  $self->render(sign => 'QQ!!', ABC=> FbM::Model::Base->alphabet);
  
}

1;
