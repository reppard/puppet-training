class apache::params {
  case $::osfamily {
    'redhat':{
      $httpd_user     = 'apache'
      $httpd_group    = 'apache'
      $httpd_pkg      = 'httpd'
      $httpd_svc      = 'httpd'
      $httpd_conf     = 'httpd.conf'
      $httpd_confdir  = '/etc/httpd/conf'
      $httpd_docroot  = '/var/www/html'
      $httpd_dirs     = ['/var/www','/var/www/html']
    }
    'debian':{
      $httpd_user    = 'www-data'
      $httpd_group   = 'www-data'
      $httpd_pkg     = 'apache2'
      $httpd_svc     = 'apache2'
      $httpd_conf    = 'apache2.conf'
      $httpd_confdir = '/etc/apache2'
      $httpd_docroot = '/var/www'
      $httpd_dirs    = '/var/www'
    }
    default: { fail("Your ${::osfamily} system is not supported.\n")}
  }
}
