class dvwa::apache {
  $secgen_parameters = secgen_functions::get_parameters($::base64_inputs_file)
  $port = $secgen_parameters['port'][0]
  $docroot = '/var/www/dvwa'

  package { ['php5', 'php5-gd', 'php5-mysql']:
    ensure => installed,
  }

  class { '::apache':
    default_vhost => false,
    default_mods => 'php',
    overwrite_ports => false,
  }

  ::apache::vhost { 'dvwa':
    port    => $port,
    docroot => $docroot,
  }
  
  mysql::db { 'dvwa_database':
    user     => 'dvwa_user',
    password => 'dvwa_passREPLACEME',
    host     => 'localhost',
    grant    => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'CREATE'],
  }

}
