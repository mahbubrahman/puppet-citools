class profile::base {
  class { '::ntp': }
  class { '::epel': stage => 'pre' }
}
