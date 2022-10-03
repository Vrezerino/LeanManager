class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.string :purchaseDate
      t.float :total
      t.string :po_number
      t.string :info

      t.timestamps
    end
  end
end
