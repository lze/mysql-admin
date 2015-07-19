if($m_nRight <= 1) {
    my $trlogin  = translate('login');
    my $password = translate('password');
    my $name     = translate('name');
    my $right_username_text = translate('right_username_text');
    my $wrong_username_text = translate('wrong_username_text');
    my $right_passwort_text = translate('right_passwort_text');
    my $wrong_passwort_text = translate('wrong_passwort_text');
    my $authen ='';
    eval(q{
      my $right_captcha_text = translate("right_captcha_text");
      my $wrong_captcha_text = translate("wrong_captcha_text");
      use Authen::Captcha;
      my $captcha = Authen::Captcha->new(
	data_folder   => "$m_hrSettings->{cgi}{bin}/config/",
	output_folder => "$m_hrSettings->{cgi}{DocumentRoot}/images",
	expire        => 300);
      my $md5sum = $captcha->generate_code(3);
      $authen = qq|<input size="5" type="hidden" name="md5" value="$md5sum"/>
      <label for="captcha"><img src="images/$md5sum.png" border="0" style="margin:0.2em;"/></label>
      <input autocomplete="off" onkeypress="if(enter(event))return false;" type="text" size="5" data-regexp="|.'/^.{3}$/'.qq|" data-error="$wrong_captcha_text" data-right="$right_captcha_text"  name="captcha"/>|;
    });
    $m_sContent .= $@ if $@;
    
    $m_sContent .= div({align => 'center'}, translate('Codenotcheckedfileerror')) if $m_nSkipCaptch eq  0;
    $m_sContent .= div({align => 'center'}, translate('Codenotcheckedfileerror')) if $m_nSkipCaptch eq -1;
    $m_sContent .= div({align => 'center'}, translate('Failednotindatabase'))     if $m_nSkipCaptch eq -2;
    $m_sContent .= div({align => 'center'}, translate('Failedinvalidcode'))       if $m_nSkipCaptch eq -3;
    $m_sContent .= qq(
    <div class="dbForm">
    <img src="images/logo.png" alt="MySQL-Admin"/>
    <form name="login" id="loginForm" class="dbForm" target="_parent" method="get" name="Login"  onsubmit="submitForm(this,'ShowDatabases','ShowDatabases');return false;">
    <label for="user" class="caption">$name</label>
    <input type="text" id="user" data-regexp=").'/^\w{4,100}$/'.qq(" data-error="$wrong_username_text" data-right="$right_username_text" name="user"/>
    <label for="password" class="caption">$password</label>
    <input type="hidden" name="action" value="login"/>
    <input autocomplete="off" type="password" data-regexp="/.{6,20}/" data-error="$wrong_passwort_text"  data-right="$right_passwort_text" id="password" name="pass"/>
    $authen
    <input type="submit"  name="submit" value="$trlogin" size="15" alt="submit" align="left"/>
    </form>
    </div>);
}
else
{
    my $lg = "javascript:closeMenu();requestURI('$ENV{SCRIPT_NAME}?action=logout','logout','logout')";
    my $welcome = translate('welcome');
    my $logout  = translate('logout');
    $m_sContent .= qq ($welcome, $m_sUser <br/><a  class="link" href="$lg">$logout</a><br/>);
}
