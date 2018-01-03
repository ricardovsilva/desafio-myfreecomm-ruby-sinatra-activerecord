class Merchant < ActiveRecord::Base
  has_many :purchase
end