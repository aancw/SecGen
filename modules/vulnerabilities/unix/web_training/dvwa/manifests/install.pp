class dvwa::install {
  $secgen_parameters = secgen_functions::get_parameters($::base64_inputs_file)

  $docroot = '/var/www/dvwa'
#   $db_username = 'csecvm'

#   Exec { path => ['/bin', '/usr/bin', '/usr/local/bin', '/sbin', '/usr/sbin'], }

#   file { "$docroot/index.html":
#     ensure => absent,
#     notify => File[$docroot],
#   }
# 
  # Copy www-data to server
  file { $docroot:
    ensure => directory,
    recurse => true,
    mode   => '0600',
    owner => 'www-data',
    group => 'www-data',
    source => 'puppet:///modules/dvwa/DVWA-master',
#     notify => File["$docroot/mysql.php"],
  }


}
