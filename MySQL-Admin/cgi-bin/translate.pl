#!/usr/bin/perl -w
use strict;
use utf8;
use lib qw(lib);     
use MySQL::Admin::Translate;
use vars qw($m_hrLang );
use CGI qw(param header);
*m_hrLang = \$MySQL::Admin::Translate::lang;
loadTranslate('config/translate.pl');
my $content ="Lang =function (){\n";
foreach my $lng (keys %{$m_hrLang}){
    foreach my $key (keys %{$m_hrLang->{$lng}}){
      my $out = lc  $key;
      $content .= "this.$lng$out='$m_hrLang->{$lng}{$key}';\n"
    }
}
$content .= "}\n";
print header(-type => 'application/javascript',-charset => 'UTF-8');
print $content;
