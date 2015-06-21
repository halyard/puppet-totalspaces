# == Class totalspaces::config
#
# This class is called from totalspaces for service config.
#
class totalspaces::config (
  $domain = 'com.binaryage.TotalSpaces2'
) {
  Boxen::Osx_defaults {
    user   => $::boxen_user,
    domain => $domain
  }

  boxen::osx_defaults { 'TotalSpaces: start at login':
    key   => 'startAtLogin',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: Check for updates':
    key   => 'SUEnableAutomaticChecks',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: Hide menu bar icon':
    key   => 'hideStatusBarIcon',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: Include prerelease updates':
    key   => 'SUIncludePreReleases',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: enable circulation':
    key   => 'enableCirculation',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: Circulate vertically':
    key   => 'circulateVertical',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: swipe to change spaces':
    key   => 'directionSwipingEnabled',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: swipe with 3 fingers':
    key   => 'numberOfFingers',
    value => 3
  }

  boxen::osx_defaults { 'TotalSpaces: invert swipe direction':
    key   => 'invertSwipeDirection',
    value => 1
  }

  boxen::osx_defaults { 'TotalSpaces: Slide to transition':
    key   => 'transitionEffect',
    value => 'Slide'
  }

  boxen::osx_defaults { 'TotalSpaces: Set transition speed':
    key   => 'transitionSpeed',
    value => 100
  }

  boxen::osx_defaults { 'TotalSpaces: Set hotkeys to move window':
    key   => 'moveWindowHotkeyFlags',
    value => 917504
  }
}
