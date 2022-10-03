class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :username #, :password

  has_many :bills
  has_many :orders
end
