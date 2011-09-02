package FbM;
use Mojo::Base 'Mojolicious';
use MojoX::Renderer::HTP;
use utf8;

# This method will run once at server start


sub startup {
  my $self = shift;
  my $pro = MojoX::Renderer::HTP->build(
            mojo => $self,
                template_options => {
                        path => [ $self->home->rel_dir('templates') ],               
                }

       );
       $self->renderer->add_handler( pro => $pro );
       $self->renderer->default_handler('pro');

  # Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
  $self->plugin('PODRenderer');

  # Routes
  my $r = $self->routes;
  $r->namespace('FbM::Controller');

  # Normal route to controller
  $r->route('/')->to('show#list');
  $r->route('/welcome')->to('example#welcome');
  
  Mojo::Loader->load('FbM::Model');
  FbM::Model->init ({
        dsn      => "dbi:Firebird:db\=/mnt/firebird/test.fdb;ib_dialect=3;",
        user     => 'SYSDBA',
        password =>'masterkey'
    });




}

1;
