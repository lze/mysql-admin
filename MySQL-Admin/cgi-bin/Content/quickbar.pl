no warnings 'redefine';

ChangeDb(
         {
          name     => $m_sCurrentDb,
          host     => $m_sCurrentHost,
          user     => $m_sCurrentUser,
          password => $m_sCurrentPass,
         }
);
my @menu = $m_oDatabase->fetch_array("show tables");
$m_sContent .= qq|<form name="changeDb" method="GET" onsubmit="submitForm(this,cAction,cAction);return false;">|;
$m_sContent .= '<div align="center">' . $m_oDatabase->GetDataBases('m_ChangeCurrentDb', 1) . '</form></div><div align="center">';
my $newAction =
    $m_sAction =~ /^(ShowTable|ShowTableDetails|EditTable)$/
  ? $1
  : 'ShowTable';
$m_sContent .= qq|
<script language="JavaScript1.5" type="text/javascript">cAction = '$newAction';</script>
<select onchange="setAction(this.options[this.options.selectedIndex].value)" style="width:75%;">
<option value="ShowTable" |
  . (param('action') eq 'ShowTable' ? 'selected="selected"' : '') . '>' . translate('show') . '</option>
<option value="ShowTableDetails" '
  . (param('action') eq 'ShowTableDetails' ? 'selected="selected"' : '') . '>' . translate('details') . '</option>
<option value="EditTable" '
  . (param('action') eq 'EditTable' ? 'selected="selected"' : '') . '>' . translate('edit') . qq'</option>
<option value="ShowDumpTable" '
  . (param('action') eq 'ShowDumpTable' ? 'selected="selected"' : '') . '>' . translate('Export') . qq'</option>
<option value="AnalyzeTable" '
  . (param('action') eq 'AnalyzeTable' ? 'selected="selected"' : '') . '>' . translate('AnalyzeTable') . qq'</option>
<option value="OptimizeTable" '
  . (param('action') eq 'OptimizeTable' ? 'selected="selected"' : '') . '>' . translate('OptimizeTable') . qq'</option>
<option value="RepairTable" '
  . (param('action') eq 'RepairTable' ? 'selected="selected"' : '') . '>' . translate('RepairTable') . qq|</option>
  </select><br/></div>|;
for (my $i = 0; $i <= $#menu; $i++){
     my $txt = $menu[$i]; 
     maxlength(15 ,\$txt);
     $m_sContent .=  qq|<a class="menuLink" href="javascript:requestURI('$ENV{SCRIPT_NAME}?action='+cAction+'&amp;table=$menu[$i]&amp;ajax=true','database','database')">$txt</a><br/>|;
}
ChangeDb(
  {
    name     => $m_hrSettings->{database}{name},
    host     => $m_hrSettings->{database}{host},
    user     => $m_hrSettings->{database}{user},
    password => $m_hrSettings->{database}{password},
  }
);
=head2  maxlength()

     maxlength($length ,\$text);

=cut

sub maxlength
{
    my $maxWidth = shift;
    ++$maxWidth;
    my $txt = shift;
    if (length($$txt) > $maxWidth) {
        my $maxLength = $maxWidth;
        my $i++;
        while ($i < length($$txt)) {
            if (substr($$txt, $i, 1) eq "<") {
                $maxLength = $maxWidth;
                do {$i++} while (substr($$txt, $i, 1) ne ">" and $i < length($$txt));
            }
            if (substr($$txt, $i, 1) eq "&") {
                $maxLength = $maxWidth;
                do {$i++} while (substr($$txt, $i, 1) ne ";" and $i < length($$txt));
            }
            $maxLength = (substr($$txt, $i, 1) =~ /\S/) ? --$maxLength : $maxWidth;
            if ($maxLength eq 0) {
                substr($$txt, $i, 1) = " ";
                $maxLength = $maxWidth;
            }
            $i++;
        }
    }
}