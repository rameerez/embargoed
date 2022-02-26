Embargoed
=======
`embargoed` is a Rails gem that blocks all requests from Russia and displays a pro-Ukraine message instead.

> Using PHP instead? 📝 WordPress? 🐍 Python Django? 👉 Check out the [list of ports](https://github.com/rameerez/embargoed-list).

Here's the message that replaces all pages of your app:


<p align="center">
  <img src="https://github.com/rameerez/embargoed/blob/main/public/embargoed-message.jpg?raw=true" alt="Embargoed message displayed to Russian visitors" width="500"/>
</p>



## Installation

Add this to your `Gemfile`:

    gem 'embargoed'

then run

    bundle install
    
_Note that you'll need to restart your Rails server before it works_

That's it! Just by having `embargoed` on your Gemfile your Rails app will display this message to all requests originating from a Russian IP.


## Collaborate

Please feel free to contact me [@rameerez](https://twitter.com/rameerez) or fork this to port it to other platforms, or make PRs to this repo to collaborate.
