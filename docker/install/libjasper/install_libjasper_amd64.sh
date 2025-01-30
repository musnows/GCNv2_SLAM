#!/usr/bin/env bash
set -e

apt-get install -y software-properties-common 
add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
apt-get -y update 
apt-get install -y libjasper1 libjasper-dev
