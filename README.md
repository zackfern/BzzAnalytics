# BzzAnalytics
## About
This project was created as a sample for a hiring manager in July of 2013. The
idea is that the application will access your Google Analytics account via the
API and OAuth, and will filter out unique results based off a sample path (for
example, every unique visit to the path `bookmarks/*`).

### Regarding Security, Production, and Bugs
As stated above, this was a quick and dirty project. It really isn't meant for
anything else than looking at. It works, yes, but it doesn't do anything useful.
I'm not going to secure it, nor am I going to do anything to make it work on
production, or fix any bugs.

## Running the Site
### Setting up your Google Analytics API Key
#### Register with Google
In order for the site to function you need a Google Analytics API key. To get
this setup, follow these instructions. Take special care to set the callback
URLs correctly. For example, if you're going to be running the site locally at
`http://localhost:3000` then your callback URL will need to be
`http://localhost:3000/auth/google_oauth2/callback`. Whatever URLs you end up
using, both in development and production, need to be listed here with
`/auth/google_oauth2/callback` appended to them.

#### Put it in the Config
Once you've got your Google API Key setup, simply edit `config/application.rb`
and set both variables in the `BUZZ_CONFIG` hash.

### Running the Server
To run the site, simply use the Rails server or anything else. Unfortunately I
couldn't get [Pow](http://pow.cx) working because of the Google Analytics API
callbacks.

## Dependencies
The site is built on [Rails 4.0.0](http://rubyonrails.org) and uses a number of
Gems to get rid of the grunt work.

- [OmniAuth](https://github.com/intridea/omniauth) for easily authenticating for Google Analytics access.
- [OAuth2](https://github.com/intridea/oauth2) for refreshing our tokens as well as building our authenticated
  requests.
- [Legato](https://github.com/tpitale/legato) for easily interfacing with the Google Analytics API.
- [Bourbon](http://bourbon.io) and [Neat](http://neat.bourbon.io) for some quick
  and nice SASS grid styling.

## Cron Script
There's a script available to automatically update all of the Filters.
In order to use it, simply add `/path/to/project && rails runner ./cron.rb` to
your crontab.
