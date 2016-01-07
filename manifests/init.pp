class pfs (
  $daemon_user = $pfs::params::daemon_user,
  $daemon_home = $pfs::params::daemon_home,
  $needed_pkgs = $pfs::params::needed_pkgs
) inherits pfs::params {

  include pfs::install
  include pfs::config
  include pfs::service
}
