#install nginx and config 


package { 'nginx':
  ensure => installed,
}

exec { 'allow_http':
  command     => ' /usr/sbin/ufw allow "Nginx HTTP"',
  refreshonly => true,
}

file { '/etc/nginx/sites-enabled/default':
  ensure  => present,
  content => 'server {
    listen 80 default_server;
    listen [::]:80 default_server;
    error_page 404 /my_error404.html;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;
    rewrite ^/redirect_me https://github.com/Abel-alx-github permanent;

    location / {
        try_files $uri $uri/ =404;
    }
}
',
  require => [Package['nginx'], Exec['allow_http']],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
