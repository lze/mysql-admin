$VAR1 = {
          'cgi' => {
                     'expires' => '+1y',
                     'style' => 'mysql',
                     'title' => 'MySQL::Admin',
                     'bin' => '/var/www/cgi-bin',
                     'serverName' => 'localhost',
                     'cookiePath' => '/',
                     'alias' => 'perl',
                     'DocumentRoot' => '/var/www/htdocs'
                   },
          'uploads' => {
                         'chmod' => 438,
                         'maxlength' => 21000000,
                         'path' => '/var/www/htdocs/download'
                       },
          'scriptAlias' => 'perl',
          'floodtime' => 10,
          'mod' => 1,
          'config' => '/var/www/cgi-bin/config/settings.pl',
          'session' => '/var/www/cgi-bin/config/session.pl',
          'database' => {
                          'password' => '',
                          'CurrentPass' => '',
                          'host' => 'localhost',
                          'name' => 'LZE',
                          'CurrentHost' => 'localhost',
                          'user' => 'root',
                          'CurrentDb' => 'LZE',
                          'CurrentUser' => 'root'
                        },
          'apacheconfig' => '/etc/apache2/sites-enabled/',
          'version' => '0.86',
          'actions' => '/var/www/cgi-bin/config/actions.pl',
          'admin' => {
                       'password' => 'testpass'
                     },
          'translate' => '/var/www/cgi-bin/config/translate.pl',
          'files' => {
                       'owner' => 'lze',
                       'group' => 'lze',
                       'chmod' => '0755'
                     },
          'language' => 'en'
        };
$m_hrSettings =$VAR1;