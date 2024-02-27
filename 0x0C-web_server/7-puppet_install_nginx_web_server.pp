#install nginx and config 
# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
    server {
      listen 80;
      server_name _;

      location = / {
        return 200 'Hello World!';
      }

      location = /redirect_me {
        return 301 https://github.com/Abel-alx-github;
      }

      error_page 404 /my_error404.html;

      location = /my_error404.html {
        return 200 'Ceci n\'est pas une page';
      }
    }
  ",
  require => Package['nginx'],
}

# Enable Nginx default site
file { '/etc/nginx/sites-enabled/default':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Restart Nginx
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => [
    Package['nginx'],
    File['/etc/nginx/sites-enabled/default'],
  ],
}
