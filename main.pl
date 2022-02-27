#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
 
get '/' => sub ($c) {
  $c->render(text => 'Hello,There is OneRC!');
};
 
app->start;
