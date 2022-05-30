package OneRC;
use Mojo::Base 'Mojolicious', -signatures;
use Mojo::Pg;
use Mojolicious::Plugin::Authentication;
use OneRC::Schema::User qw(autoload_user,validate_user);

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig',{file=>'./conf/onerc.yml'});
	$self->plugin('Authentication' => {
    autoload_user   => 1,
    session_key     => 'onerc_sessionkey',
    load_user_p     => autoload_user,
    validate_user_p => validate_user,
	});
	
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
	$r->get('/api/v1/codeexplorer/')->to('CodeExplorer#retrive');
  $r->get('/web/v0/codeexplorer/')->to('CodeExplorer#template');

}

1;
