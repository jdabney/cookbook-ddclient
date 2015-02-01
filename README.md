DESCRIPTION
===========
Configures ddclient for connecting to DynDNS or other dynamic dns providers supported by ddclient. This was originally part of the ruanwz-cookbooks repo. It has since updated with ssl support and a bug fix for the password. Future updates will include refactoring of code and some unit testing.

REQUIREMENTS
============
Platform with a package named 'ddclient'. Tested with Ubuntu 14.04.

RECIPES
=======
default
-------
The `default` recipe installs ddclient and fills out the `/etc/ddclient.conf` and `/etc/default/ddclient`.

USAGE
=====
You will need to set the attributes for your provider user, password and domain. Check the `attributes/default.rb` for other available attributes (note the 6 hour update interval). Here is an example role:

	{                                                                                                                                                
	  "name": “your-chef role”,
	  "description": "",
	  "json_class": "Chef::Role",
	  "default_attributes": {
	
	  },
	  "override_attributes": {
	    "ddclient": {
	      "login": “username”,
	      "password": “password”,
	      "domain": “yourdomain.provider.com”,
	      "server": "domains.provider.com”,
	      "use": "web, web=myip.dnsdynamic.com",
	      "interval": "300",
	      "protocol": "dyndns2"
	    }
	  },
	  "chef_type": "role",
	  "run_list": [
	    "recipe[ddclient]"
	  ],
	  "env_run_lists": {
	
	  }
	}

LICENSE AND AUTHOR
==================

Copyright:: Rilindo Foster (rilindo.foster@monzell.com)
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
