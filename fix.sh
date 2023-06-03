#!/bin/bash

# Поиск строки и комментирование в файле httpd.conf
sudo sed -i 's/^LoadModule http2_module modules\/mod_http2.so/#LoadModule http2_module modules\/mod_http2.so/' /usr/local/apache/conf/httpd.conf

# Поиск и замена в файле php.ini
# Раскомментирование строки extension=php_intl.dll
sudo sed -i 's/;extension=php_intl.dll/extension=php_intl.dll/' /usr/local/php/etc/php.ini

# Раскомментирование строки extension=php_curl.dll
sudo sed -i 's/;extension=php_curl.dll/extension=php_curl.dll/' /usr/local/php/etc/php.ini

# Раскомментирование строки extension=php_pdo_mysql.dll
sudo sed -i 's/;extension=php_pdo_mysql.dll/extension=php_pdo_mysql.dll/' /usr/local/php/etc/php.ini

# Раскомментирование строки extension=php_mysql.dll
sudo sed -i 's/;extension=php_mysql.dll/extension=php_mysql.dll/' /usr/local/php/etc/php.ini

# Раскомментирование строки extension=php_mysqli.dll
sudo sed -i 's/;extension=php_mysqli.dll/extension=php_mysqli.dll/' /usr/local/php/etc/php.ini

# Замена значения disable_functions
sudo sed -i 's/disable_functions = .*/disable_functions = passthru,chroot,chgrp,chown,ini_alter,ini_alter,ini_restore/' /usr/local/php/etc/php.ini

# Замена значения upload_max_filesize
sudo sed -i 's/upload_max_filesize = .*/upload_max_filesize = 500M/' /usr/local/php/etc/php.ini

# Замена значения memory_limit
sudo sed -i 's/memory_limit = .*/memory_limit = 256M/' /usr/local/php/etc/php.ini

# Проверка, запущен ли Apache
if pgrep -x "apache2" >/dev/null; then
  echo "Apache уже запущен. Выполняется перезапуск..."
  sudo /etc/init.d/apache2 restart
else
  echo "Apache не запущен. Выполняется запуск..."
  sudo /etc/init.d/apache2 start
fi
