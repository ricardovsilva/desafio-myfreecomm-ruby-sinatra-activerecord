class Purchase < ActiveRecord::Base
  has_one :customer, :item, :merchant
end