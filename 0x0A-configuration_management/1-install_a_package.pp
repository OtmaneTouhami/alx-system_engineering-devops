# Install Flask 2.1.0 using pip3
#
# This manifest installs Flask 2.1.0 using pip3, ensuring the python3-pip package
# is installed first. It checks if Flask 2.1.0 is already installed before
# attempting to install it, to avoid unnecessary reinstallations.
#
# This manifest was created as a response to a catastrophic incident caused by
# accidentally terminating a significant portion of our infrastructure due to
# a bug in our auto-remediation tool. Puppet's declarative language and
# idempotent behavior helped us quickly restore our infrastructure to a working
# state, highlighting the importance of configuration management tools like
# Puppet.

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  require => Package['python3-pip'],
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
  path    => '/usr/local/bin:/usr/bin:/bin',
}