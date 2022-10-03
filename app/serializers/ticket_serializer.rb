class TicketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :asset_id, :title, :description, :urgency, :inventory_user_id

  has_one :inventory_user
  has_one :asset
end
