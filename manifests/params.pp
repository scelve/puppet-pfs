class pfs::params {
  $daemon_user = 'forge'
  $daemon_home = "/opt/$daemon_user"

  case $::osfamily {
    'debian': {
      $needed_pkgs = [ 'ruby-dev', 'gcc']
      $config_file = '/etc/init/puppet-forge-server.conf'
    }
    'redhat': {
      $needed_pkgs = [ 'ruby-devel', 'gcc' ]
      $config_file = '/etc/systemd/system/puppet-forge-server.service'
    }
    default: { 
      fail('Module ${module_name} does not support ${::operatingsystem}')
    }
  }
}
