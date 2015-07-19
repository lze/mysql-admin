#!/usr/bin/perl -w
use strict;
use utf8;
use lib qw(lib);
use DBI::Library;
use MySQL::Admin::Settings;
use vars qw($m_hrSettings $m_bReturn $m_bError);
$m_bError = 0;
use CGI qw(param header);
loadSettings('config/settings.pl');
*m_hrSettings = \$MySQL::Admin::Settings::m_hrSettings;
my $m_sAction = defined param('action') ? param('action') :'settings';

if( $m_hrSettings->{login} || ( param('username') eq $m_hrSettings->{admin}{name}  &&  param('password') eq $m_hrSettings->{admin}{password}) ){

  $m_hrSettings->{admin}{name}        = defined param('username')   ? param('username')   : defined $m_hrSettings->{admin}{name} ? $m_hrSettings->{admin}{name} :'Admin';
  $m_hrSettings->{admin}{password}    = defined param('password')   ? param('password')   : $m_hrSettings->{admin}{password};
  $m_hrSettings->{cgi}{serverName}    = defined param('serverName') ? param('serverName') : $m_hrSettings->{cgi}{serverName};
  $m_hrSettings->{language}           = defined param('language')   ? param('language')   : $m_hrSettings->{language};
  $m_hrSettings->{database}{host}     = defined param('dbhost')     ? param('dbhost')     : $m_hrSettings->{database}{host};
  $m_hrSettings->{database}{user}     = defined param('dbuser')     ? param('dbuser')     : $m_hrSettings->{database}{user};
  $m_hrSettings->{database}{name}     = defined param('dbname')     ? param('dbname')     : $m_hrSettings->{database}{name};
  $m_hrSettings->{database}{password} = defined param('dbpassword') ? param('dbpassword') : $m_hrSettings->{database}{password};
}else{
  $m_hrSettings->{admin}{name}        = 'Admin';
  $m_hrSettings->{admin}{password}    = '';
  $m_hrSettings->{cgi}{serverName}    = '';
  $m_hrSettings->{language}           = 'en';
  $m_hrSettings->{database}{host}     = '';
  $m_hrSettings->{database}{user}     = '';
  $m_hrSettings->{database}{name}     = '';
  $m_hrSettings->{database}{password} = '';
  $m_sAction = 'settings';
}


print header(
    -type    => 'text/xml',
    -charset => 'UTF-8'
);
print qq(<?xml version="1.0" encoding="UTF-8"?>\n);

SWITCH:{
  if($m_sAction eq 'save'){
    if( param('username') eq $m_hrSettings->{admin}{name}  &&  param('password') eq $m_hrSettings->{admin}{password} ){
    my $m_sFile = '';
    eval(
    q|
	my %conf = (
	  name => $m_hrSettings->{database}{name},
	  host => $m_hrSettings->{database}{hsot},
	  user => $m_hrSettings->{database}{user}  
	);
	$conf{password} = $m_hrSettings->{database}{password};
	my $m_oDatabase = new DBI::Library();
	$m_oDatabase->initDB(\%conf);
	open(IN, "config/install.sql") or warn $!;
	local $/;
	$m_sFile = <IN>;
	foreach my $sql (split /;\n/, $m_sFile){
	    $m_oDatabase->void($sql);
	}
	close(IN);
	eval 'use MD5';
	unless ($@) {
	    my $md5 = new MD5;
	    $md5->add($m_hrSettings->{admin}{name});
	    $md5->add($m_hrSettings->{admin}{password});
	    my $fingerprint = $md5->hexdigest();
	    $m_oDatabase->void(qq/insert into users (`user`,`pass`,`right`,`id`) values(?,?,5,?)/, 'admin', $fingerprint,'2');
	} else {
	    warn $@;
	    $m_oDatabase->void(qq/insert into users (`user`,`pass`,`right`,`id`) values('admin','0008e525bc0894a780297b7f3aed6f58','5','2')/);
	}
      |);
      if($@ ){
        &install();
      }else{
	$m_hrSettings->{login} = 0;
	print qq|<output id="content"><![CDATA[<textarea style="width:90%;min-height:400px;">$m_sFile</textarea>]]></output>|;
	saveSettings('config/settings.pl');
      }
    }else{
      &install();
    }
    last SWITCH;
  }
  &install();
}
sub install{
  print qq|
  <output id="content">
  <![CDATA[
  <form onsubmit="submitForm(this,'SQL','SQL',false,'GET','cgi-bin/install.pl?');return false;">
    <input type="hidden" name="action" value="save"/>
    <table align="center">
      <tr>
	<td class="header"><label for="username">Username</label></td>
	<td class="header"><label for="password">Password</label></td>
	<td class="header"><label for="serverName">Host</label></td>
      </tr>
      <tr>
	<td><input style="margin:0%" id="username" type="text" name="username" value="$m_hrSettings->{admin}{name}"/></td>
	<td><input style="margin:0%" id="password" type="text" name="password" value="$m_hrSettings->{admin}{password}"/></td>
	<td><input style="margin:0%" id="serverName" type="text" name="serverName" value="$m_hrSettings->{cgi}{serverName}"/></td>
      </tr>
      <tr>
	<td class="header"><label for="dbhost">Database&#160;Host</label></td>
	<td class="header"><label for="dbusername">Database&#160;Username</label></td>
	<td class="header"><label for="dbpassword">Database&#160;Password</label></td>
      </tr>
      <tr>
	<td><input style="margin:0%" id="dbhost" type="text" name="dbhost" value="$m_hrSettings->{database}{host}"/></td>
	<td><input style="margin:0%" id="dbusername" type="text" name="dbuser" value="$m_hrSettings->{database}{user}"/></td>
	<td><input style="margin:0%" id="dbpassword" type="text" name="dbpassword" value="$m_hrSettings->{database}{password}"/></td>
      </tr>
      <tr>
	<td class="header"><label for="dbhost">Database&#160;Name</label></td>
	<td class="header"><label for="language">Language</label></td>
	<td class="header"></td>
      </tr>
      <tr>
	<td><input style="margin:0%" id="dbname" type="text" name="dbname" value="$m_hrSettings->{database}{name}"/></td>
	<td align="left">
	    <select name="language">
	    <option value="en" |.($m_hrSettings->{language} eq 'en' ? 'selected="selected"'  :'').qq|>English</option>
	    <option value="de" |.($m_hrSettings->{language} eq 'de' ? 'selected="selected"'  :'').qq|>Deutsch</option>
	    </select>
	</td>
	<td align="right"><input style="margin:-2px" type="submit" value="Install"/></td>
      </tr>
  </table>
  </form>
  ]]>
  </output>|;
  }