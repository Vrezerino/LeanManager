class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :code
      t.string :name
      t.float :price
      t.string :location
      t.string :status
      t.string :category
      t.integer :amount
      t.belongs_to :user, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
