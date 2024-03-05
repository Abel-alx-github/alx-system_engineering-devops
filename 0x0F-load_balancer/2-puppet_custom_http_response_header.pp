#install nginx and config 

package {
    'nginx':
    ensure => installed,
}

file {'/var/www/html/index.html':
    content => 'Hello World!',
}

file_line {'configure redirection':
    path  =>  '/etc/nginx/sites-available/default',
    after =>  'server_name _;',
    line  =>  "\n\tlocation /redirect_me {\n\t\treturn 301 https://github.com/Abel-alx-github;\n\t}\n",}

file {'/etc/nginx/sites-available/default':
    path  => '/etc/nginx/sites-available/default',
    after => 'server_name _;',
    line  => "    add_header X-Served-By ${hostname};",}

service {'nginx':
    ensure => running,
}
