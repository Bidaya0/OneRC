
package OneRC::Controller::CodeSnippet;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use Mojo::JSON qw(decode_json encode_json);
use Data::Dumper;

# This action will render a template
sub create ($self) {
  my $reqjson = $self->req->json;
	my $code = $reqjson->{code};
	# Render template "example/welcome.html.ep" with message
	my $res = $self->db->db->insert('codesnippets',{'code' => $code ,"user_id" => 1},{returning => 'id'})->hash->{id};
	$self->tx->res->headers->location("/api/v1/codesnippet/$res");
	return $self->render(json => {'id' => $res}, status => 201);
}

sub update ($self){
	my $id = $self->every_param('id');
  my $reqjson = $self->req->json;
	my $code = $reqjson->{code};
	$self->db->db->update('codesnippets',{'code' => $code},{id => $id});
	return $self->render(json => $id);
}

sub retrive($self){
	my $id = $self->every_param('id');
	my $res = $self->db->db->select('codesnippets','*',{id => $id})->hash;
	return $self->render(json => $res);
}

sub delete($self){
	my $id = $self->every_param('id');
	my $res = $self->db->db->delete('codesnippets',{id => $id});
	return $self->render(json => $res);
}

sub template($self){
	return $self->render("example/codesnippet");
}
1;
