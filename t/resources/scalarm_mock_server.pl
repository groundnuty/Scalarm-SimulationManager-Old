# use lib "lib/mojo/lib";


#use lib "../../lib/Mojolicious/Lite";
  use Mojolicious::Lite;

  get '/' => sub {
    my $self = shift;
    $self->render(text => 'Hello world!');
  };

 
 app->start;
