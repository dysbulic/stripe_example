# -*- coding: utf-8 -*-
class Payment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user, :amount, :stripe_token
end
