stripe_example
==============

Code for http://www.synaptian.com/blog/

* rails new .
* emacs Gemfile
* bundle install
* emacs config/database.yml
* rake db:create db:migrate
* emacs Gemfile
* bundle install
* rails generate devise:install
* emacs app/views/layouts/application.html.erb
* rails generate devise User
* rake db:migrate
* rails generate scaffold Payment stripe_token:string amount:float user:references
* emacs Gemfile
* bundle install
* emacs config/initializers/stripe.rb
* emacs app/views/layouts/application.html.erb
* STRIPE_SECRET_KEY=sk_test_&hellip; rails s
