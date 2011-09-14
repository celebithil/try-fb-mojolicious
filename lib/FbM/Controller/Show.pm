package FbM::Controller::Show;
use Mojo::Base 'Mojolicious::Controller';
use utf8;
# This action will render a template


sub list{
	my $self = shift;
	$self->render(sign => 'QQ!!');
}

1;
