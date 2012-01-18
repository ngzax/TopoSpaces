Topo Spaces Goals
=============================


How to Participate
==================


Install and Launch
==================

The project is distributed as a GitHub repository. You will need a git client. Learn more from GitHub:

* http://help.github.com/

When you have git. Use it to clone the repository:

	git clone git://github.com/ngzax/TopoSpaces.git
	cd TopoSpaces

We're using Ruby 1.9.2 which we manage with rvm:

	rvm install 1.9.2
	rvm use 1.9.2

The server is a ruby bundle. Get the bundler gem and then use it to get everything else:

	gem install bundler
	bundle install

Our initial implementation is a as Sinatra server which we run with the aid of foreman and rerun.
rerun makes it so the running app is reloaded with each change, a great help in development

Launch the server with this command:

	rerun foreman start

Now go to your browser and browse your new wiki:

	http://localhost:8888

Running specs
=============

The test suite is written using RSpec 2 and utilizes Selenium heavily. You must have a recent version of Firefox installed to run the test suite.

To run an individual spec, run

  bundle exec rspec spec/[spec name].rb

To run all specs, run

  bundle exec rake spec

Looking For Code Bloat
======================

Try this command to see if any code files have grown unpleasantly large.

	wc -l `find * | perl -ne 'next if /jquery/; print if /\.(rb|haml|sass|coffee)$/'` | sort -rgb

License
=======

You may use the TopoSpaces code pursuant to the [MIT License](https://github.com/ngzax/TopoSpaces/blob/master/mit-license.txt)

