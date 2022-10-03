class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :asset_id, :customer_id

  has_many :assets
  has_one :customer
end
