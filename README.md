puppet module for check-mk-server
=================================

check-mk-server is a general purpose nagios-plugin for retrieving data.
This module will help you to setup and configure check-mk-server as well as maintaining the counterpart of the check infrastructure exposed and maintained by my check-mk-agent module. 

Basic usage
-----------

To install and configure check-mk-server:

<pre>
	class {'check-mk-server':
		backend_name => 'foobar'
	}
</pre>


For all options, please see manifests/init.pp

Caveats
-------

None so far.

TODOs
-----

None so far.

Copyright and License
---------------------

Copyright (C) 2012 Patrick Ringl <patrick_@freenet.de>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


