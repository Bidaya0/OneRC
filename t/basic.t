use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('OneRC');
$t->get_ok('/')->status_is(200)->content_like(qr/OneRC/i);

done_testing();
