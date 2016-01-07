class pfs::service inherits pfs {
  case $::osfamily {
    'debian': {
      service { 'puppet-forge-server':
        ensure  => 'running',
        enable  => true,
        require => [ Package['puppet-forge-server'], File[$config_file] ]
      }
     }
    'redhat': {
      exec { 'systemctl-daemon-reload':
        command => '/bin/systemctl daemon-reload',
        subscribe => File[$config_file]
      } ~>
      service { 'puppet-forge-server':
        ensure  => 'running',
        enable  => true,
        require => [ Package['puppet-forge-server'], Exec['systemctl-daemon-reload'] ]
      }
    }
  }
}
