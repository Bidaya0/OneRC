
use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use Data::Dumper;

my $t = Test::Mojo->new('OneRC');

$t->get_ok('/api/v1/codeexplorer/'})
	->status_is(200)
	->json_has('/codesnippets');
done_testing();
