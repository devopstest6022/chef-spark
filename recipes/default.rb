#
# Cookbook:: spark
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'spark::install'
include_recipe 'spark::config'
include_recipe 'spark::service'
