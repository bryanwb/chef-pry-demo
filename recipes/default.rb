#
# Cookbook Name:: chef-pry-demo
# Recipe:: default
#
# Copyright (C) 2013 Bryan W. Berry
# 
# All rights reserved - Do Not Redistribute
#

# we are inside a cookbook!

foobar = node[:chef_pry_demo][:foobar]

require 'pry' ; binding.pry

ruby_block "basic ruby_block" do
  block do
    require 'pry'; binding.pry
  end
end

template '/tmp/foobar' do
  source "foobar.erb"
  variables(:foobar => foobar)
end
