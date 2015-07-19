#!/usr/bin/perl -w
use lib qw(../lib);
use HTML::Menu::Pages;
use Cwd;
my $cwd  = cwd();
my $test = new HTML::Menu::Pages;
use MySQL::Admin qw(:all);
print header;
print start_html(-title => 'HTML::Menu::Pages', -style => 'style/lze/pages.css',);
my %needed = (

        length => '345',

        style => 'lze',

        mod_rewrite => 0,

        action => "Pages",

        start => param('von') ? param('von') : 0,

        path => "../",

);
print $test->makePages(\%needed);

use showsource;
&showSource("./pages.pl");
print end_html;
