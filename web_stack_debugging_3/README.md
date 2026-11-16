# Fix WordPress database connection error in wp-config.php by correcting the database password or setting

exec { 'fix-wordpress':
  command => 'sed -i "s/error_password/correct_password/g" /var/www/html/wp-config.php',
  path    => ['/bin', '/usr/bin'],
}
