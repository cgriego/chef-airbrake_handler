Description
===========

Report [Chef](http://www.opscode.com/chef) exceptions to [Airbrake](http://airbrake.io) using the [airbrake_handler gem](https://github.com/morgoth/airbrake_handler).

Attributes
==========

* `node['airbrake_handler']['api_key']` - Your Airbrake API Key, required.
* `node['airbrake_handler']['framework_env']` - What environment to report to Airbrake, defaults to the `node.chef_environment`.
* `node['airbrake_handler']['version']` - Set the version of the airbrake_handler gem to install.

Any additional airbrake_handler attributes will be passed directly into the AirbrakeHandler class.

Usage
=====

Add `recipe[airbrake_handler]` to your run list and set the `airbrake_handler/api_key` attribute.

``` ruby
run_list("recipe[airbrake_handler]")
default_attributes("airbrake_handler" => { "api_key" => "your-airbrake-api-key" })
```
