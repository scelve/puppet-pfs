class pfs::install inherits pfs {
  # Install needed packages
  package { $needed_pkgs: 
    ensure => 'installed'
  } ->
  # Install puppet-forge-server
  package { 'puppet-forge-server':
    provider => 'gem'
  }
}
