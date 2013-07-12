class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :uid
      t.string :token
      t.datetime :token_expires_at
      t.string :refresh_token

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :uid
  end
end
