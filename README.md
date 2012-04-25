Description
===========

Report [Chef][1] exceptions to [Airbrake][2] using the [airbrake_handler gem][3].

This cookbook uses the `chef_gem` resource added in Chef 0.10.10. If you are using an earlier version of Chef, then you can install the [chef_gem cookbook][4] which backports this functionality.

[1]: http://www.opscode.com/chef
[2]: http://airbrake.io
[3]: https://github.com/morgoth/airbrake_handler
[4]: http://community.opscode.com/cookbooks/chef_gem

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
