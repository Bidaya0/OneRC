
package OneRC::Controller::CodeExplorer;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use Mojo::JSON qw(decode_json encode_json);
use Data::Dumper;


sub retrive($self){
	my $res = $self->db->db->select('codesnippets','*')->hashes;
	return $self->render(json => {'codesnippets'=> $res});
}


1;
