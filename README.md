# Rails 4 Boilerplate

This is a starting point for a simple user app in rails. This core set of gems requires very little config to get up and running.

A demo can be found here, it may take a second to load: [https://rails-4-boilerplate.herokuapp.com/](https://rails-4-boilerplate.herokuapp.com/)

## What is included in this boilerplate:
* [Rails 4](https://github.com/rails/rails)
* [Devise](https://github.com/plataformatec/devise) - Users setup & ready to go
* [Omniauth Multiauth](https://github.com/intridea/omniauth) - Facbook, Twitter, & Linkedin ready to rock
* Email SMTP - simple config with Mandrill(https://mandrillapp.com)
* [Bootstrap Sass](https://github.com/twbs/bootstrap-sass)
* [FontAwesome Sass](https://github.com/FortAwesome/font-awesome-sass)
* [Rspec Test Suite](https://github.com/rspec/rspec) (Factory Girl, Capybara, Faker, etc.)
* [Capistrano](https://github.com/capistrano/capistrano)
* [Check the Gemfile for more!](https://github.com/TristanToye/rails-4-boilerplate/blob/master/Gemfile)

## How do I set this up?

Clone the repo to your local machine.

```html
git clone https://github.com/TristanToye/rails-4-boilerplate.git
```

Run `bundle install` to install all the gems we are using.

### Configuration

Locally we are using [dotenv](https://github.com/bkeepers/dotenv), which allows us to load all the environment varibles we are using for most config functions in one file - making it easy to keep track of. You can use this in production as well, but make sure you gitignore the local file (it is in gitignore by default for this boilerplate).

Create a .env file in the root of the repo, we will use this to save our environment variables as we go through config.

### Configure Omniauth

Omniauth is a authentication library that has many great gems that allow you to quickly add different authentication options to your project. Omniauth is pre-installed and the database is setup to allow for users to signin through multiple social accounts.

To get started; in our .env we want to set a default email address that will send notifications to users (password reset, welcome message, etc.)

```html
DEVISE_EMAIL_SENDER=info@yourdomain.com
```

#### Twitter Login

If you want to use Twitter auth in your app uncomment this line from config/initializers/devise.rb

```ruby
# config.omniauth :twitter, ENV["TWITTER_APP_ID"], ENV["TWITTER_APP_SECRET"]
```

Next, get/create keys for your Twitter app [here](https://apps.twitter.com/).

Finally, set the environment variables in our .env

```html
TWITTER_APP_ID=YOUR_APP_ID
TWITTER_APP_SECRET=YOUR_APP_SECRET
```

#### Facebook Login

If you want to use Facebook auth in your app uncomment this line from config/initializers/devise.rb

```ruby
# config.omniauth :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"
```

Next, get/create keys for your Facebook app [here](https://developers.facebook.com).

Finally, set the environment variables in our .env

```html
FACEBOOK_APP_ID=YOUR_APP_ID
FACEBOOK_APP_SECRET=YOUR_APP_SECRET
```

#### LinkedIn Login

If you want to use LinkedIn auth in your app uncomment this line from config/initializers/devise.rb

```ruby
# config.omniauth :linkedin, ENV["LINKEDIN_APP_ID"], ENV["LINKEDIN_APP_SECRET"]
```

Next, get/create keys for your LinkedIn app [here](https://developer.linkedin.com/).

Finally, set the environment variables in our .env

```html
LINKEDIN_APP_ID=YOUR_APP_ID
LINKEDIN_APP_SECRET=YOUR_APP_SECRET
```

### Configure Email Via SMTP

We recommend you send your emails through [Mandrill](https://mandrillapp.com/) it's free for low usage and super easy to setup.

Generate a new API key and add it to our .env

```html
MANDRILL_USER=youremail@email.com
MANDRILL_SECRET=YOUR_SECRET
```

Next, we need to add the domain we are using to send from - for link purposes in emails. Add this to you .env file:

```html
APP_DOMAIN=yourdomain.com
```

### Database Connections

In config/database.yml we need to change the database names to what you want to use for your app. This app is setup using a database located on the same machine. 

We are again using environment variables to set the database password for production. In your .env file you will need to add:

```html
DATABASE_PASSWORD=YOUR_PASSWORD
```

By default we are using [Postgresql](http://www.postgresql.org/) for development, test, & production evironments. Rails ships with sqlite by default, but I highly recommend using the same database in development, testing, & production to ensure you are actually working with & testing what you are putting in production. To run Postgresql on OSX I highly recommend [this app](http://postgresapp.com/).

Once you have added your correct credentials, and have Postgres running, we can go ahead and create our databases locally:

```html
rake db:create db:migrate
```

To get all the tests working remeber to run this before each testing sessions - it will ensure your test database is inline with the development database structure:

```html
rake db:test:prepare```html


In some cases you may need to tell Rails what environment to use for database commands, for example:

```html
RAILS_ENV=test rake db:test:prepare
```

## How do I deploy this?

Skip this if you are hosting on [Heroku](https://www.heroku.com/). You will use the super simple [Heroku Toolbelt](https://toolbelt.heroku.com/).

If you are looking for production level deployment on non-Heroku hosts, read on.

We are using [Capistrano](https://github.com/capistrano/capistrano) for deployment. It will version, test, and deploy our latest code from a git repo to multiple environments with one line from the command line.

In this repo we have included the cap files and deployment setup, however, in practice you should gitignore these files to ensure no server details are stored in git.

To get started open config/deploy.rb and customize the following lines to match your app:

```ruby
set :application, 'rails-4-boilerplate'
set :repo_url, 'git@github.com:TristanToye/rails-4-boilerplate.git'
set :deploy_to, '/var/www/rails-4-boilerplate'
```

The deloy_to is where your web server is pointing port 80 to.

Next you will a folder config/deploy that contains two files, these are the config files for each environment you are looking to deploy to. You will need to replace the following with your own server details:

```ruby
role :app, %w{deploy@example.com}
role :web, %w{deploy@example.com}
role :db,  %w{deploy@example.com}
```

```ruby
server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value
```

To make deployment super simple, [setup a ssh key](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2) for each environment. Uncomment these lines and specify where your local key is.

```ruby
set :ssh_options, {
  keys: %w(/home/USERNAME/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(password)
}
```

To deploy simply type the following in the command line:

```html
cap production deploy
```

You may run into some memory problems with large git repos. Often a server restart can be a quick fix for freeing up a bit of memory:

```html
sudo service nginx restart
```

## How do I setup a server for this?

If you are just testing & developing nothing beats the simplicity and freeness of [Heroku](https://www.heroku.com/). They have everything ready to go out of the box and their documentation & command line tools are awesome.

If you are looking for production level servers, read on.

When setting up new servers I highly recommend making a image or snapshot of the server once setup and working. This way you can rapidly deploy new servers from that image, swap your rails app, and be ready to go in minutes.

If you are just getting started, or working on a small project I highly recommend using [DigitalOcean](https://www.digitalocean.com/?refcode=7b495d17cb37) for getting setup. They have a preconfigured server setup for Ruby on Rails using Nginx & Unicorn, and hosting starts at just $5/m - which is a great price for deploying a Rails app.

For our setup we are using [Rackspace as part of their Startups Program](http://rackspacestartups.com/) & have the following setup:
* [Ubuntu 14.04 Server](http://releases.ubuntu.com/14.04.1/)
* [Nginx](http://nginx.org/) - Web server
* [Phusion Passenger](https://www.phusionpassenger.com/documentation/Users%20guide%20Nginx.html) - Rails web app manager

DigitalOcean has by far the best documentation for setting up the stack we use. [Check it out here](https://www.digitalocean.com/community/tutorials/how-to-install-rails-and-nginx-with-passenger-on-ubuntu)

## Other things coming soon:

* How to run the test suite
