#!/usr/bin/perl -w
use strict;
use utf8;
use warnings;
#use CGI::Carp qw(fatalsToBrowser);
use lib qw(lib);
use MySQL::Admin::GUI;
ContentHeader("%PATH%/config/settings.pl");
print Body();