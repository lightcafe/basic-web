#
# Cookbook Name:: web-server
# Recipe:: default
#
# Copyright 2016, LIGHT CAFE INC.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'web-server::_nginx'
include_recipe 'web-server::_tomcat7'
