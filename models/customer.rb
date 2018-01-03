class Customer < ActiveRecord::Base
  has_many :purchase
end