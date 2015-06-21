# == Class: totalspaces
#
# Full description of class totalspaces here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class totalspaces (
  $install_path = "/Users/${::boxen_user}/Applications/TotalSpaces2.app"
) {
  class { '::totalspaces::config': } ->
  package { 'totalspaces-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  } ->
  osx_login_item { 'TotalSpaces2':
    path   => $install_path
  } ~>
  exec { "launch TotalSpaces2":
    command     => "/usr/bin/open '${install_path}'",
    refreshonly => true,
  }
}
