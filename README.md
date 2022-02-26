Embargoed
=======
Embargoed is [Rack](http://rack.rubyforge.org/) middleware with a [Ruby on Rails](http://rubyonrails.org) engine that blocks all requests from Russia and displays a pro-Ukraine message instead.

Embargoed is a fork from [Turnout](https://github.com/biola/turnout).

![Embargoed message displayed to Russian visitors](https://github.com/rameerez/embargoed/blob/main/public/embargoed-message.jpg?raw=true)


## Installation

Add this to your `Gemfile`:

    gem 'embargoed'

then run

    bundle install
    
_Note that you'll need to restart your Rails server before it works_

That's it! Just by having `embargoed` on your Gemfile your Rails app will display this message to all requests from a Russian IP.


## Collaborate

Please feel free to contact me [@rameerez](https://twitter.com/rameerez) or fork this to port it to other platforms, or make PRs to this repo to collaborate.