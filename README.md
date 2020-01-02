# Rails 4 Boilerplate

![Rails Banner](https://raw.githubusercontent.com/TristanToye/rails-4-boilerplate/master/app/assets/images/ruby-on-rails.jpg "Rails 4 Boilerplate")

**UPDATED:** I have moved this project for Rails 5, 6 & beyond here: https://github.com/TristanToye/rails-template

This is a starting point for a simple user app in rails. This core set of gems requires very little config to get up and running. The goal was to make this as simple as possible. Config all in one file, out of the box ready to rock user based app.

A demo can be found here, it may take a second to load: [https://rails-4-boilerplate.herokuapp.com/](https://rails-4-boilerplate.herokuapp.com/)

## What is included in this boilerplate:
* [Rails 4](https://github.com/rails/rails)
* [Devise](https://github.com/plataformatec/devise) - Users setup & ready to go
* [Omniauth Multiauth](https://github.com/intridea/omniauth) - Facbook, Twitter, & Linkedin ready to rock
* Email SMTP - simple config with [Mandrill](https://mandrillapp.com)
* [Slack Notifications](https://github.com/rikas/slack-poster)
* Basic Support Form - email & Slack notifications for multiple teams
* [Rails Admin](https://github.com/sferik/rails_admin) - out of the box admin UI
* [Bootstrap Sass](https://github.com/twbs/bootstrap-sass)
* [FontAwesome Sass](https://github.com/FortAwesome/font-awesome-sass)
* [Rspec Test Suite](https://github.com/rspec/rspec) (Factory Girl, Capybara, Faker, etc.)
* [Capistrano](https://github.com/capistrano/capistrano) - automated deployment
* [Guard-Livereload](https://github.com/guard/guard-livereload) - Browser Reloading in Dev
* [Check the Gemfile for more!](https://github.com/TristanToye/rails-4-boilerplate/blob/master/Gemfile)

![Features Gif](https://raw.githubusercontent.com/TristanToye/rails-4-boilerplate/master/app/assets/images/rails-4-boilerplate.gif "Rails 4 Boilerplate Features")

## How do I set this up?

Clone the repo to your local machine and cd:

```html
git clone https://github.com/TristanToye/rails-4-boilerplate.git
cd rails-4-boilerplate
```

Run `bundle install` to install all the gems we are using.

[Configure your local database connection](#database_config)

You can now run the app as normal: `rails s`

However, to use everything properly we need to set some environment variables & configuration for various services.

### Configuration

Locally we are using [dotenv](https://github.com/bkeepers/dotenv) for our secret keys, which allows us to load all the environment varibles we are using for most config functions in one file - making it easy to keep track of. You can use this in production as well, but make sure you gitignore the local file (it is in gitignore by default for this boilerplate).

Create a `.env` file in the root of the repo, we will use this to save our environment variables as we go through config.

For non-secret config we are using a YAML file found in `config/global_config.yml` - this file is used to set basic global constants that are used throughout the app. I will walk you through each part to keep it as simple as possible.

__UPDATE:__ you can now set almost all config variables (non-secrets) in the [admin panel](#rails_admin). The app will always use the first existing record of the Global Config model. When the app starts or the record is updated it will set all config variables to ones present in the database instead of the global_config.yml

### General App Config

We need to set the app_namm & app_domain in `global_config.yml`

```ruby
app_name: 'Your App Name'
app_domain: 'yoursite.com'
```

#### Secret Token

Run `rake secret` in the console and copy the key, paste it in our `.env` file:

```html
SECRET_KEY_BASE=YOUR_LONG_KEY
```

#### Livereload 

We are using guard livereload for dev. In development the browser will reload the site automatically. Very helpful for expediating design. To use this run the following in another terminal window:

```html
guard
```

### <a name="database_config"></a>Database Connections

In `config/database.yml` we need to change the database names to what you want to use for your app. This app is setup using a database located on the same machine. 

We are again using environment variables to set the database password for production. In your `.env` file you will need to add:

```html
DATABASE_PASSWORD=YOUR_PASSWORD
```

By default we are using [Postgresql](http://www.postgresql.org/) for development, test, & production evironments. Rails ships with sqlite by default for development, but I highly recommend using the same database in development, testing, & production to ensure you are actually working with & testing what you are putting in production. To run Postgresql on OSX I highly recommend [this app](http://postgresapp.com/).

Once you have added your correct credentials, and have Postgres running, we can go ahead and create our databases locally:

```html
rake db:create db:migrate
```

To get all the tests working remeber to run this before each testing sessions - it will ensure your test database is inline with the development database structure:

```html
rake db:test:prepare
```

In some cases you may need to tell Rails what environment to use for database commands, for example:

```html
RAILS_ENV=test rake db:test:prepare
```

### Configure Omniauth

Omniauth is a authentication library that has many great gems that allow you to quickly add different authentication options to your project. Omniauth is pre-installed and the database is setup to allow for users to signin through multiple social accounts.

To get started; in `global_config.yml` we want to set a default email address that will send notifications to users (password reset, welcome message, etc.)

```ruby
default_email_address: 'general_email@email.com'
```

#### Twitter Login

If you want to use Twitter auth in your app uncomment this line from `config/initializers/devise.rb`

```ruby
# config.omniauth :twitter, ENV["TWITTER_APP_ID"], ENV["TWITTER_APP_SECRET"]
```

Next, get/create keys for your Twitter app [here](https://apps.twitter.com/).

We need to add the Id to our `global_config.yml`

```ruby
twitter_app_id: 'xxxxxxxx'
```

Finally, set the secret in our `.env`

```html
TWITTER_APP_SECRET=YOUR_APP_SECRET
```

#### Facebook Login

Same process as Twitter - get/create keys for your Facebook app [here](https://developers.facebook.com).


#### LinkedIn Login

Same process as Twitter - get/create keys for your LinkedIn app [here](https://developer.linkedin.com/).

### Configure Email Via SMTP

We recommend you send your emails through [Mandrill](https://mandrillapp.com/) it's free for low usage and super easy to setup.

Add your Mandrill account email to `global_config.yml`

```ruby
mandrill_user: 'general_email@email.com'
```

Generate a new [API key on Mandrill's site](https://mandrillapp.com/settings/index/) and add it to our `.env`

```html
MANDRILL_SECRET=YOUR_SECRET
```

### Slack & Support Email

We have included a Slack webhook gem to make setting up live notifications from you app super easy. Your whole team can know what is happening in app, get critical updates on the go, and keep their inbox empty. You will need to add an 'Incoming Webhook' integration for this to work.

We will add the Slack Token for the inegration to our `.env` file:

```html
SLACK_TOKEN=xxxxxxxx
```
Next, update the options avaliable for sending messages in `global_config.yml`

```ruby
# Slack Team name
slack_team: 'team-name'

# Default Icon for Slack Sending Messages
slack_icon_url: 'https://github.com/apple-touch-icon-144.png'

# Default Slack User to send natifications as
slack_user: 'Rails Bot'

# Default contacts for technical request
technical_slack_channel: '#technical'

# Default contacts for feedback
feedback_slack_channel: '#feedback'

# Default for all other notifications
default_slack_channel: '#general'
```
When sending notifications there are many more options & ways to make this more dynamic for your needs - sending users profile images as icons for example - refer to the [docs here.](https://github.com/rikas/slack-poster)

If you don't want to use Slack we have included an option for that as well, simple swap the following to false:

```ruby
use_slack: true
```

#### Email Support

For email support we have 3 different default teams to send support emails to. Update where to send these in `global_config.yml`

```ruby
# Default contacts for technical request
technical_support_email: 'tech_team@email.com'

# Default contacts for feedback
feedback_support_email: 'support_team@email.com'

# Default for all other emails & notifications
default_email_address: 'general_email@email.com'
```

## <a name="rails_admin"></a>Using Rails Admin panel

[Rails Admin](https://github.com/sferik/rails_admin) generates a basic admin panel that lets you CRUD any resource and is fairly easy to extend.

We have added an admin boolean to the users table to indicate if that user has certain permissions. Devise does work for multiple user types if you want to make a seperate admin model, but for simplicity we have decided to use this user setting.

The default admin panel can be found at `yourdomain.com/admin` The first user to visit this url is made an admin. After that you can with make another user an admin by using the admin panel to update the user record, or update the user from the rails console.

__UPDATE:__ you can now set almost all config variables in the admin panel. The app will always use the first existing record of the Global Config model. When the app starts or the record is updated it will set all config variables to ones present in the database instead of the global_config.yml

NOTE: Mandrill user for email SMTP will still need to be set in global_config.yml for intialization reasons.

## Running the Test Suite

We are using [Rspec](https://github.com/rspec/rspec) for testing. To run the exisitng tests in command line type:

```html
rspec
```

K.I.S.S. To learn more about writing tests in Rails using this setup I highly recommend [Everyday Rails, Testing with RSpec](https://leanpub.com/everydayrailsrspec?a=1i6GUwZeH5Hg_yvzO2SWPv). It goes over all the basics & gives you a practical approach to Test Driven Development. 

## How do I deploy this?

Skip this if you are hosting on [Heroku](https://www.heroku.com/). You will use the super simple [Heroku Toolbelt](https://toolbelt.heroku.com/).

If you are looking for production level deployment on non-Heroku hosts, read on.

We are using [Capistrano](https://github.com/capistrano/capistrano) for deployment. It will version, test, and deploy our latest code from a git repo to multiple environments with one line from the command line.

In this repo we have included the cap files and deployment setup, however, in practice you should gitignore these files to ensure no server details are stored in git.

To get started open `config/deploy.rb` and customize the following lines to match your app:

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

* How to get to the moon on Rails
* More test coverage
* UI Dashboard improvment
