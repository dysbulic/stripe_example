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
* emacs config/routes.rb
* git rm public/index.html
* emacs app/controllers/payments_controller.rb
* emacs app/views/payments/_form.html.erb
* git mv app/assets/javascripts/payments.js.coffee app/assets/javascripts/payments.js
* emacs app/assets/javascripts/payments.js
* emacs app/controllers/payments_controller.rb
* rails g migration add_stripe_customer_token_to_users stripe_customer_token:string
* rake db:migrate
