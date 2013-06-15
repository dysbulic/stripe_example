class Payment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :stripe_token
end
