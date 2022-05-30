package OneRC::Schema::User;
use Mojo::Pg;
use OneRC::Schema::Base;


sub autoload_user($uid){
	return 1;
	return $uid;
}

sub validate_user($c, $username, $password, $extradata){
	return 1;
	return $uid;
}

1;
