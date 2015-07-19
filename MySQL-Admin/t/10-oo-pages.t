use lib qw(lib);
BEGIN {
   @ENV{"SCRIPT_NAME"} = ("mysql.pl");
}
use HTML::Menu::Pages;
use Test::More tests => 1;
use Cwd;
my $cwd  = cwd();
my $test = new HTML::Menu::Pages;
my %needed = (
              start        => '20',
              length       => '345',
              style        => 'mysql',
              mod_rewrite  => 1,
              action       => 'dbs',
              linkspropage => 3,
);
ok(length($test->makePages(\%needed)) > 0);
