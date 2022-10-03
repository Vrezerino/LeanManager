class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :asset, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.integer :urgency
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
