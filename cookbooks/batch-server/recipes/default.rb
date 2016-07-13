#
# Cookbook Name:: batch-server
# Recipe:: default
#
# Copyright 2016, LIGHT CAFE INC.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'batch-server::_nginx'
include_recipe 'batch-server::_jenkins'
include_recipe 'batch-server::_rundeck'
