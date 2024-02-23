# Using Puppet, install flask from pip3.

package {'flask':
  ensure          => installed,
  provider        => 'pip3',
  install_options => ['--version', '2.1.0']
}
