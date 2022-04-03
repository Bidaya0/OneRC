package OneRC;
use Mojo::Base 'Mojolicious', -signatures;
use Mojo::Pg;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig',{file=>'./conf/onerc.yml'});
	
	if ($config->{database}->{type} eq 'postgres') {
		my $host = $config->{database}->{host};
		my $port = $config->{database}->{port};
		my $database = $config->{database}->{database};
		my $username = $config->{database}->{username};
		my $password = $config->{database}->{password};
		
		#helper(db => sub { state $db = Mojo::Pg->new("postgresql://$username:$password\@$host:$port/$database") });
		#$self->helper(db => sub { state $db = Mojo::Pg->new("postgresql://$username:$password\@$host:$port/$database") });
		$self->helper(db => sub { state $db = Mojo::Pg->new("postgresql://$username:$password\@$host:$port/$database") });
		`sqitch target --chdir /var/lib/onerc/database/pg add pg db:pg://$username:$password\@$host:$port/$database `;
		print `sqitch deploy --chdir /var/lib/onerc/database/pg pg`;
	};
  # Configure the application
  $self->secrets($config->{secrets});
  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Example#welcome');
	$r->post('/api/v1/codesnippet')->to('CodeSnippet#create');
	$r->get('/api/v1/codesnippet/:id')->to('CodeSnippet#retrive');
	$r->put('/api/v1/codesnippet/:id')->to('CodeSnippet#update');
	$r->delete('/api/v1/codesnippet/:id')->to('CodeSnippet#delete');
  $r->get('/web/v0/codesnippet')->to('CodeSnippet#template');

}

1;
