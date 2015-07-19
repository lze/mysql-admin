package MySQL::Admin::GUI;
use strict;
use warnings;
use utf8;
use DBI::Library::Database qw(:all);
use HTML::Menu::Pages;
use MySQL::Admin qw(:all :lze :cgi-lib);
use HTML::Entities;
use User::pwent;
use MySQL::Admin::Settings;
use MySQL::Admin::Translate;
use MySQL::Admin::Config;
use MySQL::Admin::Session;
use Encode;
use Fcntl qw(:flock);
use Symbol;
use URI::Escape;
# use diagnostics;
#use CGI::Carp qw(fatalsToBrowser);
require Exporter;
use vars qw( $DefaultClass $ACCEPT_LANGUAGE @EXPORT @ISA $m_bMod_perl %m_hUniq $m_hrParams $m_hrSettings $m_hrLng $m_nStart $m_nEnd $m_nRight $m_sAction $m_sSid $m_sStyle $m_sTitle $m_sUser $m_sContent $m_sCurrentDb $m_sCurrentHost  $m_sCurrentUser $m_sCurrentPass  $m_sAjax  $m_nSkipCaptch );
@MySQL::Admin::GUI::EXPORT  = qw( ContentHeader Body ChangeDb Unique );
@ISA                        = qw( Exporter MySQL::Admin );
$MySQL::Admin::GUI::VERSION = '0.86';
$m_bMod_perl                = ( $ENV{MOD_PERL} ) ? 1 : 0;
local $^W = 0;
our @m_processlist;
our $m_bFirstTime = 0;
our $m_oDatabase;
our $m_dbh;
  
=head1 NAME

MySQL::Admin::GUI - Just a MySQL administration Web-App

=head1 SYNOPSIS

use MySQL::Admin::GUI;
ContentHeader("config/settings.pl");
print Body();

=head2 EXPORT

  action Body maxlength openFile

=cut

=head2 ContentHeader

    ContentHeader("/path/to/your/settings.pl");

=cut

sub ContentHeader 
{
    my $m_hrSettingsfile = shift;
    init($m_hrSettingsfile)  unless $m_bMod_perl and $m_bFirstTime;
   
    $m_sAjax = qq(<?xml version="1.0" encoding="UTF-8"?>\n<xml>);
    $m_nSkipCaptch = 0;

    #todo klären wiso m_hrLng durch init nicht gesetzt wird.

    *m_hrLng = \$MySQL::Admin::Translate::lang;
    $m_oDatabase = new DBI::Library::Database();
    $m_oDatabase->serverName( $m_hrSettings->{cgi}{serverName} );
    $m_oDatabase->floodtime( $m_hrSettings->{floodtime} );
    $m_dbh = $m_oDatabase->initDB(
      {
	  name     => $m_hrSettings->{database}{name},
	  host     => $m_hrSettings->{database}{host},
	  user     => $m_hrSettings->{database}{user},
	  password => $m_hrSettings->{database}{password},
      }
    ) unless $m_bFirstTime;
    $m_bFirstTime = 1;
    $m_sCurrentDb =
        param('m_ChangeCurrentDb')
      ? param('m_ChangeCurrentDb')
      : $m_hrSettings->{database}{CurrentDb};
    $m_sAction =  param('action') ? param('action') : 'ShowDatabases';#todo settings

    $m_sAction = ( $m_sAction =~ /^(\w{3,50})$/ ) ? $1 : $m_sAction;
    $m_sCurrentHost = param('m_shost') ? param('m_shost') : $m_hrSettings->{database}{CurrentHost};
    $m_sCurrentUser = param('m_suser') ? param('m_suser') : $m_hrSettings->{database}{CurrentUser};
    $m_sCurrentPass = param('m_spass') ? param('m_spass') : $m_hrSettings->{database}{CurrentPass};

    if ( param('m_ChangeCurrentDb') )
    {
        $m_hrSettings->{database}{CurrentDb}   = $m_sCurrentDb;
        $m_hrSettings->{database}{CurrentHost} = $m_sCurrentHost;
        $m_hrSettings->{database}{CurrentUser} = $m_sCurrentUser;
        $m_hrSettings->{database}{CurrentPass} = $m_sCurrentPass;
        $m_sAction                             = 'ShowTables';
        saveSettings($m_hrSettingsfile);
    }
    my $cookiepath = $m_hrSettings->{cgi}{cookiePath};

    $m_sSid = cookie( -name => 'sid' );
    $m_sSid = defined $m_sSid ? $m_sSid : '123';
    $m_sUser = $m_oDatabase->getName($m_sSid);
    $m_sUser = defined $m_sUser ? $m_sUser : 'guest';
    my @aCookies;
    if ( $m_sAction eq 'logout'  or ( $m_sUser  eq 'guest' and  $m_sAction ne 'login' ) ) {
        my $cookie = cookie(
            -name    => 'sid',
            -value   => '',
            -expires => '-1d',
            -path    => "$cookiepath"
        );
        push @aCookies, $cookie;
        print header(
            -type    => 'text/xml',
            -charset => 'UTF-8',
            -cookie  => [@aCookies]
        );
        $m_sUser   = 'guest';
        $m_sSid    = '123';
        $m_sAction = 'showLogin';
    }elsif ( $m_sAction eq 'login') {
        my $ip = remote_addr();
        my $u  = param('user');
        my $p  = param('pass');
        $m_nSkipCaptch = 0;
        eval('
	use Authen::Captcha;
        my $captcha = Authen::Captcha->new(data_folder   => "$m_hrSettings->{cgi}{bin}/config/",
                                           output_folder => "$m_hrSettings->{cgi}{DocumentRoot}/images");
        $m_nSkipCaptch = $captcha->check_code(param("captcha"), param("md5"));
        ');
        $m_nSkipCaptch = 1 if $@;
        if ( defined $u && defined $p && defined $ip && $m_nSkipCaptch > 0) {
            use MD5;
            my $md5 = new MD5;
            $md5->add($u);
            $md5->add($p);
            my $cyrptpass = $md5->hexdigest();
            my $result    = 1;
            if ( $m_oDatabase->checkPass( $u, $cyrptpass ) ) {
                $m_sSid = $m_oDatabase->setSid( $u, $p, $ip );
                my $cookie = cookie(
                    -name    => 'sid',
                    -value   => "$m_sSid",
                    -path    => "$cookiepath",
                    -expires => '+1y'
                );
                push @aCookies, $cookie if $result eq 1;
                print header(
                    -type    => 'text/xml',
                    -charset => 'UTF-8',
                    -cookie  => [@aCookies]
                );
		 $m_sUser = $u;
            }
            else {
                print header(
                    -type    => 'text/xml',
                    -charset => 'UTF-8',
                );
            }
        } else {
            print header(
                -type    => 'text/xml',
                -charset => 'UTF-8',
            );
        }
        $m_sAction = 'ShowDatabases';
    }else {
        print header(
            -type    => 'text/xml',
            -charset => 'UTF-8'
        );
    }
}

=head2 Body

  print Body();

=cut

sub Body
{
    CGI::upload_hook(\&hook);
    $m_sStyle = $m_hrSettings->{cgi}{style};
    $m_nStart = param('von')               ? param('von') :  0;
    $m_nStart = ( $m_nStart =~ /^(\d+)$/ ) ? $1           :  0;
    $m_nEnd   = param('bis')               ? param('bis') : 30;
    $m_nEnd   = ( $m_nEnd =~ /^(\d+)$/ )   ? $1           :  0;
    if ( $m_nStart < 0 ) {
        $m_sAction = 'exploit';
        $m_nStart  = 0;
    }
    $m_nRight   = $m_oDatabase->userright($m_sUser);
    $m_nRight   = defined $m_nRight ? $m_nRight: 0;
    my $exploit = 0;
    my @action_set = $m_oDatabase->fetch_AoH("select actions.action,actions.file,actions.title,actions.right,actions.sub,actions_set.output_id from actions join actions_set on actions.action = actions_set.foreign_action where actions_set.action = ?",$m_sAction);
    $exploit = 1 if $@;
    for( my $i = 0; $i <= $#action_set; $i++ ) {
	$m_sContent = "";#change main Db
	my $action = $action_set[$i];
	$m_sTitle = $action->{title};
	if ( $m_nRight >= $action->{right} ){
	  do("$m_hrSettings->{cgi}{bin}/Content/$action->{file}") if  -e "$m_hrSettings->{cgi}{bin}/Content/$action->{file}";
	  eval($action->{sub}) if $action->{sub} ne 'main';	  
	  $m_sAjax .= qq|<output id="errorMessage"><![CDATA[$@]]></output>| if $@;
	  $m_sAjax .= qq|<output id="$action->{output_id}"><![CDATA[$m_sContent]]></output>|;
	}else{
	  $exploit = 1;
	}
    }
    if($exploit) {
        $m_sContent = "";
        do("$m_hrSettings->{cgi}{bin}/Content/exploit.pl");
        $m_sAjax .= qq|<output id="errorMessage"><![CDATA[$@ ]]></output>| if $@;
        $m_sAjax .= qq|<output id="content"><![CDATA[$m_sContent]]></output>| if $m_sContent;
    }else{#change main Db
	ChangeDb(
	    {
	    name     => $m_hrSettings->{database}{name},
	    host     => $m_hrSettings->{database}{host},
	    user     => $m_hrSettings->{database}{user},
	    password => $m_hrSettings->{database}{password},
	    }
	);
    }
    clearSession();
    return $m_sAjax . '</xml>';
}

=head2 ChangeDb

    my %db = {

	    name => '',

	    host   => '',

	    user => '',

	    password => '',

    };

    ChangeDb(\%db);

=cut

sub ChangeDb 
{
    my $hash = shift;
    my $m_sTitle = $hash->{title} if ( defined $hash->{title} );
    $m_dbh = $m_oDatabase->initDB(
        {
            name     => $hash->{name},
            host     => $hash->{host},
            user     => $hash->{user},
            password => $hash->{password},
        }
    );
}

=head2 Unique()

  $unique =Unique();

=cut

sub Unique 
{
    my $unic;
    do { $unic = int( rand(1000000) ); } while ( defined $m_hUniq{$unic} );
    $m_hUniq{$unic} = 1;
    return $unic;
}

=head1 SEE ALSO

L<CGI> L<MySQL::Admin>
L<DBI> L<DBI::Library> L<DBI::Library::Database>
L<MySQL::Admin::Main> L<HTML::TabWidget>  L<HTML::Menu::Pages>


=head1 AUTHOR

Dirk Lindner <dirk.lze@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005-2015 by Hr. Dirk Lindner

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation;
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

=cut

1;
