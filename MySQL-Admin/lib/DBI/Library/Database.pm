package DBI::Library::Database;
use strict;
use warnings FATAL => 'all';
no warnings 'redefine';
use utf8;
use HTML::Entities;
use vars qw( 
  $m_dbh
  $m_dsn
  $m_sDefaultClass 
  @EXPORT_OK
  @ISA 
  %m_hFunctions
  $m_sServerName
  $m_nSecs
);
$m_sDefaultClass = 'DBI::Library::Database' unless defined $DBI::Library::Database::m_sDefaultClass;
require Exporter;
use DBI::Library qw(:all $m_dbh $m_dsn);
@DBI::Library::Database::ISA    = qw(DBI::Library Exporter);
@DBI::Library::Database::EXPORT = qw(useexecute);
@DBI::Library::Database::EXPORT_OK = qw(getIndex CurrentPass CurrentUser CurrentHost CurrentDb Driver execute useexecute quote void fetch_hashref fetch_AoH fetch_array updateModules deleteexecute editexecute addexecute tableLength tableExists addUser hasAcount isMember right checkPass checkSession setSid getName initDB checkFlood GetColumns GetAttrs GetCollation GetColumnCollation GetExtra GetNull GetEngineForRow GetEngines GetCharacterSet GetDataBases GetAutoIncrement GetPrimaryKey GetAutoIncrementValue fetch_string);
%DBI::Library::Database::EXPORT_TAGS = (
    'all' => [ qw(getIndex CurrentPass CurrentUser CurrentHost CurrentDb Driver addUser hasAcount isMember right checkPass checkSession setSid getName initDB tableLength tableExists useexecute void fetch_hashref fetch_AoH fetch_array updateModules deleteexecute editexecute addexecute  checkFlood GetColumns GetAttrs GetCollation GetColumnCollation GetExtra GetNull GetEngineForRow GetEngines GetCharacterSet GetDataBases GetAutoIncrement GetPrimaryKey GetAutoIncrementValue fetch_string)],
    'dynamic' => [qw(CurrentPass CurrentUser CurrentHost CurrentDb Driver useexecute void fetch_hashref fetch_AoH fetch_array updateModules deleteexecute editexecute addexecute)],
    'independent' => [qw(CurrentPass CurrentUser CurrentHost CurrentDb Driver tableLength tableExists initDB useexecute void fetch_hashref fetch_AoH fetch_array updateModules deleteexecute editexecute addexecute fetch_string)],
    'lze' => [ qw(getIndex CurrentPass CurrentUser CurrentHost CurrentDb Driver addUser hasAcount isMember right checkPass checkSession setSid getName checkFlood GetColumns GetAttrs GetCollation GetColumnCollation GetExtra GetNull GetEngineForRow GetEngines GetCharacterSet GetDataBases GetAutoIncrement GetPrimaryKey GetAutoIncrementValue) ],
);
$DBI::Library::Database::VERSION = '0.86';
$m_nSecs                         =  10;

=head1 NAME

DBI::Library::Database - Database interface for MySQL::Admin::GUI

=head1 SYNOPSIS

use DBI::Library::Database;

=head2 new()

constructor

=cut

sub new
{
    my ($class, @initializer) = @_;
    my $self = {};
    bless $self, ref $class || $class || $m_sDefaultClass;
    $m_dbh = $self->SUPER::initDB(@initializer) if (@initializer);
    return $self;
}

=head2 getName()

      $name = $m_oDatabase->getName($m_sSid);

=cut

sub getName
{
    my ($self, @p) = getSelf(@_);
    my $m_sSid = $p[0];
    if (defined $m_sSid) 
    {
      my $sql = 'SELECT user FROM `users` where sid = ?;';
      my $sth = $m_dbh->prepare($sql) or warn $m_dbh->errstr;
      $sth->execute($m_sSid) or warn $m_dbh->errstr;
      my $name = $sth->fetchrow_array();
      $sth->finish();
      return $name;
    }
    else 
    {
      return 'guest';
    }
}

=head2 setSid

      $sid = $m_oDatabase->setSid( name, pass );

=cut

sub setSid
{
    my ($self, @p) = getSelf(@_);
    my $name = $p[0];
    my $pass = $p[1];
    my $ip   = $p[2];
    use POSIX qw(strftime);
    my $time = strftime "%d.%m.%Y %H:%M:%S", localtime;
    use MD5;
    my $md5 = new MD5;
    $md5->add($name);
    $md5->add($pass);
    $md5->add($time);
    $md5->add($ip);
    my $fingerprint = $md5->hexdigest();
    my $sql         = 'UPDATE users  SET sid = ? ,ip = ? WHERE user = ?';
    my $sth         = $m_dbh->prepare($sql);
    $sth->execute($fingerprint, $ip, $name);
    $sth->finish();
    return $fingerprint;
}

=head2 checkSession

    $bool = $m_oDatabase->checkSession($m_sUser,$m_sSid);

=cut

sub checkSession
{
    my ($self, @p) = getSelf(@_);
    my $m_sUser = shift @p;
    my $ssid    = shift @p;
    my $ip      = shift @p;
    my $return  = 0;
    if (length($m_sUser) > 3 && length($ssid) > 3) {
        my $sql = 'select sid from  users where  user = ?';
        my $sth = $m_dbh->prepare($sql);
        $sth->execute($m_sUser) or warn $m_dbh->errstr;
        my $session = $sth->fetchrow_array();
        $sth->finish();
        $return = 1 if (defined $session && defined $ssid && $ssid eq $session);
    }
    return $return;
}

=head2 checkPass()



=cut

sub checkPass
{
    my ($self, @p) = getSelf(@_);
    my $u  = $p[0];
    my $cp = $p[1];
    use MD5;
    if (defined $u) {
        my $sql = q(SELECT pass  FROM users where user = ?);
        my $sth = $m_dbh->prepare($sql) or warn $m_dbh->errstr;
        $sth->execute($u);
        my $cpass = $sth->fetchrow_array();
        $sth->finish();
        $cpass = defined $cpass ? $cpass : 0;
        return ($cp eq $cpass) ? 1 : 0;
    }
    return 0;
}

=head2 right()

      $nRight = right($m_sAction,$m_sUsername);

=cut

sub right
{
    my ($self, @p) = getSelf(@_);
    my $sUser = $p[0];
    return userright($sUser);
}

=head2 userright()

      userright( user );

=cut

sub userright
{
    my ($self, @p) = getSelf(@_);
    my $sUser = $p[0];
    my $sql   = 'SELECT `right`  FROM users where `user` = ? ';
    my $sth   = $m_dbh->prepare($sql);
    $sth->execute($sUser);
    my @q = $sth->fetchrow_array;
    $sth->finish();
    return $q[0];
}

=head2 topicright()

      topicright( id );

=cut

sub topicright
{
    my ($self, @p) = getSelf(@_);
    my $id  = $p[0];
    my $sql = 'SELECT `right` FROM news where id = ?';
    my $sth = $m_dbh->prepare( $sql );
    $sth->execute( $id );
    my @q = $sth->fetchrow_array;
    $sth->finish();
    return $q[0];
}

=head2 catright()

    catright( 'name|name2' );

=cut

sub catright
{
    my ($self, @p) = getSelf(@_);
    my $cat = $p[0];
    my @select = split /\|/, $cat;
    my %sel;
    $sel{$_}   = 1 foreach @select;
    my @cats   = $self->fetch_AoH('SELECT * FROM cats');
    my $nRight = 0;
    for( my $i = 0; $i <= $#cats; $i++ )
    {
        $nRight = $cats[$i]->{right} if ($sel{$cats[$i]->{name}} && $cats[$i]->{right} > $nRight);
    }
    return $nRight;
}

=head2 isMember

      isMember($m_sUser);

=cut

sub isMember
{
    my ($self, @p) = getSelf(@_);
    my $m_sUser = lc $p[0];
    if (defined $m_sUser)
    {
        my $sth = $m_dbh->prepare('SELECT user  FROM users where user = ?') or warn $m_dbh->errstr;
        $sth->execute($m_sUser);
        my ($member) = $sth->fetchrow_array();
        $sth->finish();
        return defined $member ? ($m_sUser eq $member) ? 1 : 0 : 0;
    }
    else 
    {
        return 1;
    }
}

=head2 hasAcount

      bool hasAcount( $email )

=cut

sub hasAcount
{
    my ($self, @p) = getSelf(@_);
    my $mail = lc $p[0];
    if (defined $mail) {
        my $sth = $m_dbh->prepare('SELECT email  FROM users where email = ?') or warn $m_dbh->errstr;
        $sth->execute($mail);
        my ($email) = $sth->fetchrow_array();
        $sth->finish();
        return ($mail eq $email) ? 1 : 0;
    } else {
        return 1;
    }
}

=head2 addUser

      $m_oDatabase->addUser(user, pass,mail);

=cut

sub addUser
{
    my ($self, @p) = getSelf(@_);
    my $newuser = $p[0];
    my $newpass = $p[1];
    my $mail    = $p[2];
    use MD5;
    my $md5     = new MD5;
    $md5->add($newuser);
    $md5->add($newpass);
    my $fingerprint = $md5->hexdigest();
    my $sql_addUser = q/insert into users (user,pass,email,`right`,cats) values(?,?,?,1,'news|member')/;
    my $sth         = $m_dbh->prepare($sql_addUser);
    my $anzahl      = $sth->execute($newuser, $fingerprint, $mail) or warn $m_dbh->errstr;
    $sth->finish();
    return 1 if ($anzahl + 0 == 1);
}

=head2 serverName()

set serverName.

=cut

sub serverName
{
    my ($self, @p) = getSelf(@_);
    if (defined $p[0])
    {
      $m_sServerName = $p[0];
    }
    else
    {
      return $m_sServerName;
    }
}

=head2 floodtime()

set floodtime.

=cut

sub floodtime
{
    my ($self, @p) = getSelf(@_);
    if (defined $p[0])
    {
      $m_nSecs = $p[0];
    }
    else
    {
      return $m_nSecs;
    }
}

=head2 checkFlood

checked wann die letzte aktion der ip adresse war und

erlaubt sie nur wenn midestens time zeit zur letzen aktion vergangen ist.

checkFlood(ip,optionaler abstand in sekunden )

checkFlood( remote_addr() );

=cut

sub checkFlood
{
    my ($self, @p) = getSelf(@_);
    my $ip = $p[0];
    $m_nSecs = defined $p[1] ? $p[1] : $m_nSecs;
    my $return = 0;
    if (defined $ip) {
        my $sql = q(SELECT ti  FROM flood where remote_addr = ? );
        my $sth = $m_dbh->prepare($sql) or warn $m_dbh->errstr;
        $sth->execute($ip);
        my $ltime = $sth->fetchrow_array();
        unless (defined $ltime)
        {
            $self->void('insert into flood (remote_addr, ti) VALUES(?,?)', $ip, time());
            $return = 1;
        }
        else
        {
            $return = ( time() - $ltime > $m_nSecs ) ? 1 : 0;
            $self->void('update flood set ti =?  where remote_addr = ?', time(), $ip);
        }
        $sth->finish();
    }
    return $return;
}

=head2 GetAutoIncrementValue()

    GetAutoIncrementValue(table)

=cut

sub GetAutoIncrementValue
{
    my ($self, @p) = getSelf(@_);
    my $name = $p[0];
    my @a = $self->fetch_AoH('SHOW TABLE STATUS');
    for (my $i = 0; $i <= $#a; $i++)
    {
        return $a[$i]->{Auto_increment} if ($a[$i]->{Name} eq $name);
    }
}

=head2 GetPrimaryKey()

       liefert die primary_key(s) der tabelle zurueck

       @array = GetPrimaryKey(table)

=cut

sub GetPrimaryKey
{
    my ($self, @p) = getSelf(@_);
    my $tbl = $p[0];
    if( defined $tbl )
    {
        $tbl = $m_dbh->quote_identifier($tbl);
        my @caption = $self->fetch_AoH("show columns from $tbl");
        my @return;
        for (my $j = 0; $j <= $#caption; $j++)
        {
            push @return, $caption[$j]->{'Field'} if ($caption[$j]->{'Key'} eq 'PRI');
        }
        push @return, $caption[0]->{'Field'} if $#caption eq 0;
        return @return;
    }else{
        return 0;
    }
}

=head2 getIndex()

=cut

sub getIndex
{
    my ($self, @p) = getSelf(@_);
    my $tbl = $p[0];
    if (defined $tbl){
        $tbl = $m_dbh->quote_identifier($tbl);
	my $hr =   $self->fetch_hashref("SHOW CREATE TABLE $tbl");
	my @return;
	foreach my $line ( split /\n/,$hr->{'Create Table'}){
	  if($line =~/(PRIMARY KEY|FOREIGN KEY|FULLTEXT KEY|UNIQUE KEY|KEY) (`([^`]+)`)? ?(\(([^)]+)\))?/){
	      my $type = $1;
	      my $name = $type eq 'FOREIGN KEY' ? $return[$#return]->{field} : $2;  
	      delete $return[$#return];
	      my $sfields = $5;
	      my @fields;
	      push @fields, /`([^`]+)`/ for split ',' , $5;
	      if($line =~/REFERENCES `([^`]+)` \(([^)]+)\)/){
		my $table= $1;
		my @references;
		push @references, /`([^`]+)`/ for split ',' , $2;
		push @return,{
		    field             =>  /`([^`]+)`/,
		    foreignTable      =>  $table,
		    foreignFields     =>  [@fields],
		    foreignReferences =>  [@references],
		    name              => $name,
		    type              => $type,
		    ondelete => $line =~/ON DELETE CASCADE/ ? 'CASCADE' :$line =~/ON DELETE SET DEFAULT/ ? 'SET DEFAULT' :'',
		    onupdate => $line =~/ON UPDATE CASCADE/ ? 'CASCADE' :$line =~/ON UPDATE SET DEFAULT/ ? 'SET DEFAULT' :'',
		} for split ',' , $sfields;
		}else{
		  push @return, {
		      field =>  /`([^`]+)`/,
		      name  => $name,
		      type  => $type,
		  } for split ',' , $5;
		}
	    }
	}
	return @return;
    }
}

=head2 getConstraintKeys()

=cut

sub getConstraintKeys
{
    my ($self, @p) = getSelf(@_);
    my $tbl = $p[0];
    my $key = $p[1];
    my @return;
    if (defined $tbl)
    {
	$tbl = $m_dbh->quote_identifier($tbl);
        my $hr =   $self->fetch_hashref("SHOW CREATE TABLE $tbl");
  	foreach my $line ( split /\n/,$hr->{'Create Table'}){
	  my %keys;
	  if($line =~/CONSTRAINT `([^`]+)` FOREIGN KEY \(([^)]+)\)/)
	  {
	    my $i = 0;
	    for( split ',' ,$2)
	    {
	      /`([^`]+)`/;
	      $keys{$1} = 1;
	    }
	    push @return, $1 if($keys{$key} and $return[$#return-1] ne $1 );
	  }
	}
	return @return;
    }
}

=head2 GetAutoIncrement()

    returns the auto_increment Column.

    GetAutoIncrement(table)

=cut

sub GetAutoIncrement
{
    my ($self, @p) = getSelf(@_);
    my $tbl = $p[0];
    if (defined $tbl) {
        $tbl = $m_dbh->quote_identifier($tbl);
        my @caption = $self->fetch_AoH("show columns from $tbl");
        my $r;
        for (my $j = 0; $j <= $#caption; $j++)
        {
            $r = $caption[$j]->{'Field'} if ($caption[$j]->{'Extra'} eq 'auto_increment');
        }
        return $r;
    }
    else 
    {
        return 0;
    }
}

=head2 fetch_string()


=cut

sub fetch_string
{
    my ($self, @p) = getSelf(@_);
    my @a = $self->fetch_array(@p);
    return $a[0];
}

#html erzeugende funktionen

=head2 GetDataBases()

     returns a <select> list with the Databases.

=cut

sub GetDataBases
{
    my ($self, @p) = getSelf(@_);
    my $name = $p[0] ? shift(@p) : 'm_ChangeCurrentDb';
    my $change = $p[0] ? 'onchange="submitForm(this.form)"' : '';
    my $m_sCurrentDb = $self->CurrentDb();
    my @dbs          = $self->fetch_array('show Databases');
    my $return       = qq|<select align="center" $change name="$name" style="width:75%" >|;
    $return .=
      $_ eq $m_sCurrentDb
      ? qq|<option  value="$_"  selected="selected" >$_(| . $self->TableCount4Db($_) . q|)</option>|
      : qq|<option  value="$_">$_(| . $self->TableCount4Db($_) . q|)</option>| foreach @dbs;

    $return .= '</select>';
    return $return;
}

=head2 TableCount4Db()

     Gibt die anzahl der tabellen fuer die angegebene Datenbank zurueck.

=cut

sub TableCount4Db
{
    my ($self, @p) = getSelf(@_);
    $p[0] = $m_dbh->quote_identifier($p[0]);
    my @count = $self->fetch_array("show tables from $p[0]");
    warn $@ if $@;
    return $#count > 0 ? $#count : 0;
}

=head2 GetCharacterSet()

    gibt das Charset zu coalation zurueck.

    GetCharacterSet(coalation);

=cut

sub GetCharacterSet
{
    my ($self, @p) = getSelf(@_);
    my $c = shift @p;
    if (defined $c) {
        my $coalation = $self->fetch_hashref("SHOW COLLATION like ?", $c);
        return $coalation->{Charset};
    } else {
        return 0;
    }
}

=head2 GetEngines()

    gibt die verfuegbaren Engines zurueck.

    GetEngines(tabelle);

=cut

sub GetEngines
{
    my ($self, @p) = getSelf(@_);
    my $tbl  = shift @p;
    my $name = shift @p;
    if (defined $tbl) {
        my @co     = $self->fetch_AoH('SHOW ENGINES');
        my $status = $self->fetch_hashref('SHOW TABLE STATUS where `Name` = ? ', $tbl);
        my $return = qq|<select class="editTable" name="$name">|;
        $return .=
          $_->{Engine} eq $status->{Engine}
          ? qq|<option  value="$_->{Engine}"  selected="selected" >$_->{Engine}</option>|
          : qq|<option  value="$_->{Engine}">$_->{Engine}</option>|
          foreach @co;
        $return .= '</select>';
        return $return;
    } else {
        return 0;
    }
}

=head2 GetEngineForRow()

    GetEngineForRow(tabelle, zeile);

=cut

sub GetEngineForRow
{
    my ($self, @p) = getSelf(@_);
    my $tbl  = shift @p;
    my $name = shift @p;
    if (defined $tbl && defined $name){
        my @co       = $self->fetch_array('SHOW ENGINES');
        my @EINGINES = $self->fetch_AoH('SHOW TABLE STATUS where `Name` = ?  ', $tbl);
        my $return   = qq|<select class="editTable" name="$name">|;
        $return .=
          $_->{Engine} eq "@co"
          ? qq|<option  value="$_->{Engine}"  selected="selected" >$_->{Engine}</option>|
          : qq|<option  value="$_->{Engine}">$_->{Engine}</option>|
          foreach @EINGINES;
        $return .= '</select>';
        return $return;
    }else{
        return 0;
    }
}

=head2 GetNull()

    gibt die NULL( NULL | not NULL ) auswahlliste zurueck

    GetNull( selected extra, slect_name );

=cut

sub GetNull
{
    my ($self, @p) = getSelf(@_);
    my $null = shift @p;
    my $name = shift @p;
    if (defined $null && defined $name) {
        my $return = qq|<select class="editTable" name="$name">|;
        $return .= qq|<option value="not NULL">not NULL</option>|;
        $return .=
          $null eq 'YES'
          ? qq|<option  value="NULL" selected="selected">NULL</option>|
          : qq|<option value="NULL">NULL</option>|;
        $return .= q|</select>|;
        return $return;
    } else {
        return 0;
    }
}

=head2 GetExtra()

        gibt die extra(auto_increment) auswahlliste zurueck

        GetExtra(selected extra, slect_name);

=cut

sub GetExtra
{
    my ($self, @p) = getSelf(@_);
    my $selected = shift @p;
    my $name     = shift @p;
    if (defined $selected && defined $name) {
        my $return = qq|<select class="editTable" name="$name">|;
        $return   .= '<option value=""></option>';
        $return   .=
          $selected eq "auto_increment"
          ? q|<option  value="auto_increment" selected="selected">auto_increment</option>|
          : q|<option value="auto_increment">auto_increment</option>|;
        $return .= q|</select>|;
        return $return;
    } else {
        return 0;
    }
}

=head2 GetColumnCollation()

       gibt eine auswahlliste (select) zurueck.

       GetColumnCollation( tabelle ,columne, name_select);

=cut

sub GetColumnCollation
{
    my ($self, @p) = getSelf(@_);
    my $tbl    = shift @p;
    my $column = shift @p;
    my $name   = shift @p;
    if (defined $tbl && defined $column && defined $name) {
        $tbl = $m_dbh->quote_identifier($tbl);
        my $col       = $self->fetch_hashref("show full columns from $tbl where field = ?", $column);
        my @collation = $self->fetch_AoH("SHOW COLLATION");
        my $return    = qq|<select class="editTable" name="$name" style="width:100px;"><option></option>|;
        unless ($col->{Collation}) {
            $return .= qq|<option  value="NULL"  selected="selected" >NULL</option>|;
        } else {
            $return .=
              $_->{Collation} eq $col->{Collation}
              ? qq|<option  value="$_->{Collation}"  selected="selected" >$_->{Collation}</option>|
              : qq|<option  value="$_->{Collation}">$_->{Collation}</option>|
            foreach @collation;
        }
        $return .= '</select>';
        return $return;
    } else {
        return 0;
    }
}

=head2 GetCollation()

    $sel = GetCollation( name, selected );

=cut

sub GetCollation
{
    my ($self, @p) = getSelf(@_);
    my $name      = shift @p;
    my $selected  = shift @p;
    no warnings; #$selected maybe empty
    my @collation = $self->fetch_AoH("SHOW COLLATION");
    if ($name) {
        my @a = $self->fetch_AoH("SHOW TABLE STATUS");
        for (my $i = 0; $i <= $#a; $i++) {
            $selected = $a[$i]->{Collation} if ($a[$i]->{Name} eq $selected);
        }
    }
    my $return = qq|<select class="editTable" name="$name" style="width:100px;"><option></option>|;
    $return .= qq|<option  value="$_->{Collation}"|.( $selected eq $_->{Collation} ? 'selected="selected"' : '').qq|>$_->{Collation}</option>| foreach @collation;
    $return .= '</select>';
    return $return;
}

=head2 GetCharset()

    $sel = GetCharset(name,selected table);

=cut

sub GetCharset
{
    my ($self, @p) = getSelf(@_);
    my $name      = shift @p;
    my $selected  = shift @p;
    my @Charset = $self->fetch_AoH("SHOW Charset");
    if ($name) {
        my @a = $self->fetch_AoH("SHOW TABLE STATUS");
        for (my $i = 0; $i <= $#a; $i++) {
                $selected = $a[$i]->{Collation} if ($a[$i]->{Name} eq $selected);
        }
        }
        $selected = GetCharacterSet($selected );
    my $return = qq|<select class="editTable" name="$name" style="width:100px;"><option></option>|;
    $return .= qq|<option  value="$_->{Charset}"| . ($selected eq $_->{Charset} ? 'selected="selected"' : '') . qq|>$_->{Charset}</option>| foreach @Charset;
    $return .= '</select>';
    return $return;
}

=head2 GetAttrs

       $sel = GetAttrs($tbl, $field, $name );

=cut

sub GetAttrs
{
    my ($self, @p) = getSelf(@_);
    my $tbl    = shift @p;
    my $select = shift @p;
    my $name   = shift @p;
    if ($tbl) {
	 $tbl    = $m_dbh->quote_identifier($tbl);
        my $hr     = $self->fetch_hashref("SHOW CREATE TABLE $tbl");
        my $return = qq|<select class="editTable" name="$name" style="width:100px;">
    <option ></option>
    <option  value="UNSIGNED" |
          . (
             $hr->{'Create Table'} =~ /$select[^,]+unsigned/
             ? 'selected="selected"'
             : ''
          )
          . q|>UNSIGNED</option><option  value="UNSIGNED ZEROFILL" |
          . (
             $hr->{'Create Table'} =~ /$select[^,]+unsigned zerofill/
             ? 'selected="selected"'
             : ''
          )
          . q|>UNSIGNED ZEROFILL</option><option  value="ON UPDATE CURRENT_TIMESTAMP"  |
          . (
             $hr->{'Create Table'} =~ /$select[^,]+on update CURRENT_TIMESTAMP/
             ? 'selected="selected"'
             : ''
          )
          . q|>ON UPDATE CURRENT_TIMESTAMP</option></select>|;
        return $return;
    } else {
        return qq(
	  <select class="editTable" name="$name" style="width:100px;">
	  <option ></option>
	  <option  value="UNSIGNED" ) .                    ( $select eq 'UNSIGNED'                    ? 'selected="selected"' : '') . q(>UNSIGNED</option>
	  <option  value="UNSIGNED ZEROFILL" ) .           ( $select eq 'UNSIGNED ZEROFILL'           ? 'selected="selected"' : '') . q(>UNSIGNED ZEROFILL</option>
	  <option  value="ON UPDATE CURRENT_TIMESTAMP" ) . ( $select eq 'ON UPDATE CURRENT_TIMESTAMP' ? 'selected="selected"' : '') . q(>ON UPDATE CURRENT_TIMESTAMP</option>
	  </select>);
    }
}

=head2 GetColumns

    $sel = GetColumns($tbl , $name, $selected);

=cut

sub GetColumns
{
    my ($self, @p) = getSelf(@_);
    my $tbl      = shift @p;
    my $name     = shift @p;
    my $selected = $p[0] ? shift @p : '';
    $tbl =$m_dbh->quote_identifier($tbl);
    my @col      = $self->fetch_AoH("show columns from $tbl");
    my $return   = qq|<select class="editTable" name="$name" style="width:100px;">|;
    $return .= qq|<option  value="$_->{Field}" | . ($selected eq $_->{Field} ? 'selected="selected"' : '') . qq|>$_->{Field}</option>| foreach @col;
    $return .= '</select>';
    return $return;
}

=head2 getSelf()

    getSelf or CGI

=cut

sub getSelf
{
    return @_ if defined($_[0]) && (!ref($_[0])) && ($_[0] eq 'DBI::Library::Database');
    return (defined($_[0]) && (ref($_[0]) eq 'DBI::Library::Database' || UNIVERSAL::isa($_[0], 'DBI::Library::Database')))
      ? @_
      : ($DBI::Library::Database::m_sDefaultClass->new, @_);
}

package DBI::Library::Database::db;
use vars qw(@ISA);
@ISA = qw(DBI::Library:::db);

=head2 prepare()

=cut

sub prepare
{
    my ($m_dbh, @args) = @_;
    my $sth = $m_dbh->SUPER::prepare(@args) or return;
    return $sth;
}

package DBI::Library::Database::st;
use vars qw(@ISA);
@ISA = qw(DBI::Library::st);

=head2 execute()

=cut

sub execute
{
    my ($sth, @args) = @_;
    my $rv = $sth->SUPER::execute(@args) or return;
    return $rv;
}

=head2 fetch()

=cut

sub fetch
{
    my ($sth, @args) = @_;
    my $row = $sth->SUPER::fetch(@args) or return;
    return $row;
}

=head1 SEE ALSO

L<MySQL::Admin::GUI> L<DBI> L<DBI::Library>

=head1 AUTHOR

Dirk Lindner <lze@cpan.org>

=head1 LICENSE

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
