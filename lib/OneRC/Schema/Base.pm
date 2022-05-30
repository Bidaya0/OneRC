package OneRC::Schema::Base;
use Mojo::Pg;

sub db (){ 
	state $db = Mojo::Pg->new("postgresql://$username:$password\@$host:$port/$database");
	return $db;
}


1;
