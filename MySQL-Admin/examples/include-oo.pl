#!/usr/bin/perl -w
use strict;
use lib qw(../lib);
use MySQL::Admin qw(param);
my $m_oCgi = MySQL::Admin->new();
$m_oCgi->init("/srv/www/cgi-bin/config/settings.pl");
print $m_oCgi->header;
if( param('include') ) {
    $m_oCgi->include();
    print $m_oCgi->a( { href => "$ENV{SCRIPT_NAME}" }, 'next' );
    $m_oCgi->clearSession();
} else {
    my %vars = (
        user   => 'guest',
        action => 'main',
        file   => "./content.pl",
        sub    => 'main'
    );
    my $qstring = $m_oCgi->createSession( \%vars );
    print qq(Action wurde erzeugt.);
    print $m_oCgi->br(),
        $m_oCgi->a( { href => "$ENV{SCRIPT_NAME}?include=$qstring" },
        'next' );
}
use showsource;
&showSource('./include-oo.pl');
