#install nginx and config 

exec { 'update system':
        command => '/usr/bin/apt-get update',
}
package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/var/www/html/my_error404.html':
  ensure  => file,
  content => "Ceci n'est pas une page",
  require => Package['nginx'],
}

file { '/var/www/html/redirect_me':
  ensure  => file,
  content => 'https://github.com/Abel-alx-github',
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      server_name _;
      rewrite ^/redirect_me https://github.com/Abel-alx-github permanent;
      listen 80 default_server;
      error_page 404 /my_error404.html;
    }
  ",
  require => Package['nginx'],
}

file { '/etc/nginx/sites-enabled/default':
  ensure  => link,
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx'],
}
