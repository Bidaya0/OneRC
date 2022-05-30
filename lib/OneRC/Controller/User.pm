package OneRC::Controller::User;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use Mojo::JSON qw(decode_json encode_json);
use Data::Dumper;

#sub state_extract($state){
#	my ($oauthtype, $state_code) = split(/-/,$state);
#	return ($oauthtype, $state_code);
#}
#
#
#sub state_validate($self, $state){
#	my ($oauthtype, $state_code) = state_extract($state);
#		
#}
#
#sub oauth2redirect ($self) {
#	my $code = $self->every_param('code');
#	my $state = $self->every_param('state');
#	return $self->render(status => 200);	
#}

sub create ($self) {
  my $reqjson = $self->req->json;

	my $username = $reqjson->{username};
	my $password = $reqjson->{password};
	# Render template "example/welcome.html.ep" with message
	my $res = $self->db->db->insert('user',{'username' => $username ,"password" => $password},{returning => 'id'})->hash->{id};
	#$self->tx->res->headers->location("/api/v1/codesnippet/$res");
	return $self->render(json => {'id' => $res}, status => 201);
	#return $self->render(json => {}, status => 201);
}

sub login ($self){
  my $reqjson = $self->req->json;
	my $username = $reqjson->{username};
	my $password = $reqjson->{password};
	
}


1;
