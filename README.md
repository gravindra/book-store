## Book store

# Setup

  `bundle install`

  `rake db:setup`

  `rails server`

# Ruby Gems

  - devise: used for authentication
  - paperclip: used to upload product image
  - twitter-bootstrap-rails: used to integrate bootstrap UI framework
  - whenever: used to run cron jobs which will run task to delete user inactive carts data.

# Features

  - User can add products in carts without login
  - User have to login while cart checkout to maintain its carts items
  - User cart data will get expired 2 days since their last updates
  - Added cron job to monitor user carts updates


# special one scenario test case

  - To test special case scenario add products in user carts and then from backend update product price which is present in user cart
  - Output: User will see text below product name which indicates product price change.

# Run test cases

  `rspec`

