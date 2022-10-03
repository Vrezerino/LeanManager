class AssetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :code, :name, :price, :location, :status, :category, :amount, :inventory_user_id, :image_url

  has_many :tickets
  has_one :inventory_user
end
