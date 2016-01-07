class pfs::config inherits pfs {
  # Create deamon user
  user { "$daemon_user":
    shell => '/bin/false',
    home => "$daemon_home",
    managehome => true
  } ->
  # Create needed directories
  file { ["$daemon_home/modules", "$daemon_home/log", "$daemon_home/cache"]:
    ensure => 'directory',
    owner => $daemon_user,
    group => $daemon_user,
    mode  => 644
  } ->
  file { $config_file:
    ensure  => file,
    content => template("$module_name/config.$::osfamily.erb"),
    require => Package['puppet-forge-server']
  }
}
