use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use Data::Dumper;

my $t = Test::Mojo->new('OneRC');
$t->post_ok('/codesnippet' => json => {'code' => 'print("Hello World\n");'})
	->status_is(201)
	->header_like(Location => qr/\/codesnippet\/[0-9]+$/);


my $path = $t->tx->result->headers->{'location'} // '/codesnippet/1';

$t->get_ok($path)
	->status_is(200)
	->json_has('/code');

$t->put_ok($path)
	->status_is(200);

$t->delete_ok($path)
	->status_is(200);



done_testing();
