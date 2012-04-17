#
# Cookbook Name:: airbrake_handler
# Recipe:: default
#
# Copyright 2012, Chris Griego
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe "chef_handler"

if defined?(Chef::Resources::ChefGem)
  chef_gem "airbrake_handler" do
    version node["airbrake_handler"]["version"]
  end
else
  gem_package "airbrake_handler" do
    action :nothing
    version node["airbrake_handler"]["version"]
  end.run_action(:install)

  Gem.clear_paths
end

gem "airbrake_handler"

chef_handler "AirbrakeHandler" do
  action :nothing
  arguments Mash.new(node["airbrake_handler"].to_hash).tap { |args| args.delete("version") }.symbolize_keys
  source "airbrake_handler"
  supports :exception => true
end.run_action(:enable)
