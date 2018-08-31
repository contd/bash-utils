#!/usr/bin/env bash

#
# Common Service shortcuts

# Admin shortcuts
alias supgrade="sudo apt update && sudo apt upgrade"

# Services
alias nginx.start='sudo systemctl start nginx.service'
alias nginx.stop='sudo systemctl stop nginx.service'
alias nginx.stat='sudo systemctl status nginx.restart'
alias nginx.restart='nginx.stop && nginx.start'
alias nginx.test='sudo nginx -t'
alias php-fpm.start="sudo systemctl start php7.1-fpm.service"
alias php-fpm.stop="sudo systemctl stop php7.1-fpm.service"
alias php-fpm.restart='sudo systemctl restart php7.1-fpm.service'
