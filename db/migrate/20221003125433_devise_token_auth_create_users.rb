class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|

      ## User Info
      #t.string :username
      #t.string :email

      ## Tokens
      #t.text :tokens

      #t.timestamps
    end

    add_index :users, [:uid, :provider], unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
