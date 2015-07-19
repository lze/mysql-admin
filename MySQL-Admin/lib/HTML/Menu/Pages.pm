package HTML::Menu::Pages;
use Template::Quick;
use strict;
use utf8;
use warnings FATAL => 'all';
no warnings 'redefine';
require Exporter;
use vars qw(
  $DefaultClass
  @EXPORT
  @ISA
  $action
  $length
  $nStart
  $sStyle
  $mod_rewrite
  $append
  $pages
  $path
  $per_page
  $bAjax
);
@HTML::Menu::Pages::EXPORT  = qw(makePages);
@ISA                        = qw(Exporter);
$HTML::Menu::Pages::VERSION = '0.86';
$DefaultClass               = 'HTML::Menu::Pages' unless defined $HTML::Menu::Pages::DefaultClass;

=head1 NAME

HTML::Menu::Pages - Create html anchors

=head1 SYNOPSIS

use HTML::Menu::Pages;

=head2 OO Syntax.

        my $test = new HTML::Menu::Pages;

                my %needed =(

                        length => '345',

                        style => 'mysql',

                        mod_rewrite => 0,

                        action => 'dbs',

                        start  => param('von') ? param('von') : 0,

                        path => "/srv/www/cgi-bin/",

                        append => '?queryString=testit'

                );

        print $test->makePages(\%needed );

=head2 FO Syntax.

        my %needed =(

                length => '345',

                style => 'mysql',

                mod_rewrite => 0,

                action => 'dbs',

                start  => param('von') ? param('von') : 0,

                path => "/srv/www/cgi-bin/",

                append => '?queryString=testit',

                links_pro_page => 30

        );

        print makePages(\%needed );

# 
=head2 Changes

0.37

       links_pro_page option


=head2 EXPORT

makePages

=head1 Public

=head2 Public new()


=cut

sub new
{
    my ($class, @initializer) = @_;
    my $self = {};
    bless $self, ref $class || $class || $DefaultClass;
    return $self;
}

=head2 makePages()

see SYNOPSIS

=cut

sub makePages
{
    my ($self, @p) = getSelf(@_);
    my $hashref = $p[0];
    $action  = $hashref->{action};
    $nStart    = $hashref->{start} > 0 ? $hashref->{start} : 0;
    $sStyle    = $hashref->{style};
    $mod_rewrite = $hashref->{mod_rewrite} ? $hashref->{mod_rewrite} : 0;
    $append      = $hashref->{append} ? $hashref->{append} : '';
    $length      = $hashref->{length} ? $hashref->{length} : 0;
    $pages       = $hashref->{title} ? $hashref->{title} : '0';
    $path        = $hashref->{path} ? $hashref->{path} : 'cgi-bin/';
    $per_page    = $hashref->{links_pro_page} ? $hashref->{links_pro_page} : 10;
    $bAjax     = $hashref->{ajax} ? $hashref->{ajax} : 0;
    $self->ebis() if ($length > $per_page);
}

=head2 ebis()

private

=cut

sub ebis
{
    my ($self, @p) = getSelf(@_);
    my $previousPage = (($nStart - $per_page) > 0) ? $nStart - $per_page : 0;
    my $nextPage = $nStart;
    $nextPage = $per_page if ($previousPage <= 0);
    my %template = (
                    path     => "$path/templates",
                    style    => $sStyle,
                    template => "pages.htm",
                    name     => 'pages'
    );
    my @data = (
                {
                 name  => 'header',
                 pages => '<a class ="menuLink3" href="'
                   . (
                      "javascript:requestURI('$ENV{SCRIPT_NAME}?action=$action&ajax=true&$append','$action','$action')"
                   )
                   . '">'
                   . $pages . '</a>',
                },
    );
    push @data,
      { 
        name => "previous",
        href => "javascript:requestURI('$ENV{SCRIPT_NAME}?von=$previousPage&bis=$nextPage&action=$action&ajax=true&$append','$action','$action')",
      }
      if ($nStart - $per_page >= 0);
    my $sites = 1;

    if ($length > 1) {
        if ($length % $per_page == 0) {
            $sites = (int($length / $per_page)) * 10;
        } else {
            $sites = (int($length / $per_page) + 1) * 10;
        }
    }
    my $beginn = $nStart / $per_page;
    $beginn = (int($nStart / $per_page) + 1) * 10 unless ($nStart % $per_page == 0);
    $beginn = 0 if ($beginn < 0);
    my $b = ($sites >= 10) ? $beginn : 0;
    $b = ($beginn - $per_page >= 0) ? $beginn - $per_page : 0;
    my $h1 = (($nStart - ($per_page * 5)) / $per_page);
    $b = $h1 if ($h1 > 0);
    my $m_nEnd = ($sites >= 10) ? $b + $per_page : $sites;
    $b      = int($b);
    $m_nEnd = int($m_nEnd);

    while ($b <= $m_nEnd) {    # append links
        my $c = $b * $per_page;
        my $d = $c + $per_page;
        $d = $length if ($d > $length);
        my $svbis = "javascript:requestURI('$ENV{SCRIPT_NAME}?von=$c&bis=$d&action=$action&ajax=true&$append','$action','$action')" ;
        push @data, ($b * $per_page eq $nStart)
          ? {
             name  => 'currentLinks',
             href  => $svbis,
             title => $b + 1,
          }
          : {
             name  => 'links',
             href  => $svbis,
             title => $b + 1,
          };
        last if ($d eq $length);
        $b++;
    }
    my $v    = $nStart + $per_page;
    my $next = $v + $per_page;
    $next = $length if ($next > $length);
    my $esvbis = "javascript:requestURI('$ENV{SCRIPT_NAME}?von=$v&bis=$next&action=$action&ajax=true&$append','$action','$action')";
#     :" $ENV{SCRIPT_NAME}?von=$v&amp;bis=$next&amp;action=$action&amp;$append";
    push @data,
      {
        name => "next",
        href => $esvbis
      } if ($v < $length);    # apend the Next "button"
    push @data, {name => 'footer'};    # apend the footer
    return initTemplate(\%template, \@data);
}

=head2  getSelf()

privat see L<HTML::Menu::TreeView>

=cut

sub getSelf
{
    return @_ if defined($_[0]) && (!ref($_[0])) && ($_[0] eq 'HTML::Menu::Pages');
    return (defined($_[0]) && (ref($_[0]) eq 'HTML::Menu::Pages' || UNIVERSAL::isa($_[0], 'HTML::Menu::Pages')))
      ? @_
      : ($HTML::Menu::Pages::DefaultClass->new, @_);
}

=head1 AUTHOR

Dirk Lindner <dirk.lze@gmail.com>


=head2 see Also

L<CGI> L<MySQL::Admin::GUI> L<MySQL::Admin::Actions> L<MySQL::Admin::Translate> L<MySQL::Admin::Settings> L<MySQL::Admin::Config>


=head1 LICENSE

Copyright (C) 2005 - 2015 by Hr. Dirk Lindner

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation;
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

=cut

1;
