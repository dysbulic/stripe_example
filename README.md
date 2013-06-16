Stripe Example
==============

Simple example to show both anonymous and saved card tranactions in Stripe.

More information at http://www.synaptian.com/blog/

# Quick Start

* git clone git://github.com/wholcomb/stripe_example.git
* cd stripe_example
* heroku apps:create
* git push heroku master
* heroku run rake --trace db:migrate
* *Sign up for [Stripe](http://stripe.com)*
* heroku config:set STRIPE_SECRET_KEY=sk_test_&hellip;
* heroku config:set STRIPE_PUBLISHABLE_KEY=pk_test_&hellip;

## Commands used to create this application

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
* *Debugging&hellip;*
* heroku apps:create synaptian-stripe-example
* git push heroku master
* heroku run rake --trace db:migrate
* heroku config:set STRIPE_SECRET_KEY=sk_test_&hellip;

# License

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
