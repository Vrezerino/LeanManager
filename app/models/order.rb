class Order < ApplicationRecord
  belongs_to :asset
  belongs_to :customer
  has_one :bill
end
