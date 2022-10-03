class BillSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_id, :order_id, :purchase_date, :total, :po_number, :info

  has_one :customer
  has_one :order
end
