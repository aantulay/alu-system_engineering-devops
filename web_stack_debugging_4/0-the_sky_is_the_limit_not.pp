# Increase Nginx worker processes, worker connections, and system file descriptor limits to handle high concurrency benchmarking

exec { 'fix-for-nginx':
  command => 'bash -c "
    sed -i \"s/worker_connections 768;/worker_connections 4096;/g\" /etc/nginx/nginx.conf &&
    sed -i \"s/# worker_rlimit_nofile.*;/worker_rlimit_nofile 65536;/g\" /etc/nginx/nginx.conf ||
    echo \"worker_rlimit_nofile 65536;\" >> /etc/nginx/nginx.conf
    service nginx restart
  "',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
