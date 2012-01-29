TopoSpaces
=============================

*Topological spaces* are mathematical structures that allow the formal definition
of concepts such as convergence, connectedness, and continuity. They appear in
virtually every branch of modern mathematics and are a central unifying notion.

The branch of mathematics that studies topological spaces in their own right is
called *topology.*

A topological space is a set X together with _T_, a collection of subsets of X,
satisfying the following axioms:[1]

The empty set and X are in <math>\tau</math>.
_T_ is closed under arbitrary union.
_T_ is closed under finite intersection.

The collection _T_ is called a topology on X. The elements of X are usually called
points, though they can be any mathematical objects. A topological space in
which the points are functions is called a function space. The sets in are
called the open sets, and their complements in X are called closed sets. A
subset of X may be neither closed nor open, either closed or open, or both. A
set that is both closed and open is called a clopen set.

-- http://en.wikipedia.org/wiki/Topological_space

A TopoSpace is a Community that allows the formal discussion of Ideas in a 
federated structure that _you_ control allowing you to control who you allow
into your Community.

Goals
=============================

NOTE: This Project is still in the very experimental phase and may change drastically.

How to Participate
==================

Code contributions are always welcome. 
We're developing using the `fork and pull request` model supported so well by GitHub. 
Please read through their excellent help to make sure you know what's expected of you:

* http://help.github.com/send-pull-requests/

If you'd like to know what we think of your programming idea before you program it, just write up an Issue here on GitHub. 
You're save us all some time if you read through open issues first:

* [Open Issues](https://github.com/ngzax/TopoSpaces/issues?sort=created&direction=desc&state=open&page=1)

We're proud to be forked frequently. Go ahead and fork this project now. We're glad to have you.

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

	http://localhost:5000

Running the Tests
=================

The test suite is written using Minitest. 
I used watchr for continuous testing and have included it in the bundle 
and added a pattern file in test/watcr.rb 

  gem install watchr
  watchr test/watchr.rb

Now, when you touch any file it will run the all the tests.

To run all the tests manually, you can hit Ctrl-c at any time.
Hitting Ctrl-c twice in a row will exit watchr.

License
=======

You may use the TopoSpaces code pursuant to the [MIT License](https://github.com/ngzax/TopoSpaces/blob/master/mit-license.txt)

