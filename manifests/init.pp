# == Class: totalspaces
#
# Installs and configures totalspaces
#
class totalspaces (
  $install_path = "/Users/${::boxen_user}/Applications/TotalSpaces2.app"
) {
  class { '::totalspaces::config': } ->
  package { 'totalspaces-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }
  -> osx_login_item { 'TotalSpaces2':
    path   => $install_path
  }
  ~> exec { 'launch TotalSpaces2':
    command     => "/usr/bin/open '${install_path}'",
    refreshonly => true,
  }
}
