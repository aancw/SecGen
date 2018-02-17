class dvwa::config {
  $secgen_parameters = secgen_functions::get_parameters($::base64_inputs_file)
  
  $docroot = '/var/www/dvwa'

  file { "$docroot/config/config.inc.php":
    ensure  => present,
    mode   => '0600',
    owner => 'www-data',
    group => 'www-data',
    content  => template('dvwa/config.inc.php.dist.erb')
  }

}