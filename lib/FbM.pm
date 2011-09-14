package FbM;
use Mojo::Base 'Mojolicious';
use utf8;

# This method will run once at server start


sub startup {
  my $self = shift;


  # Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
  $self->plugin('PODRenderer');

  # Routes
  my $r = $self->routes;
  $r->namespace('FbM::Controller');

  # Normal route to controller
  $r->route('/')->to('show#index');
  
  
  
  $r->route('/welcome')->to('example#welcome');
  
  Mojo::Loader->load('FbM::Model');
  FbM::Model->init ({
        #dsn      => "dbi:Firebird:db\=/mnt/firebird/test.fdb;ib_dialect=3;",
        dsn      => "dbi:Firebird:hostname=127.0.0.1;db=VTEST;ib_dialect=3;",
        user     => 'SYSDBA',
        password => 'masterkey'
    });
	Mojo::Loader->load('FbM::Model::Base');



}

1;
