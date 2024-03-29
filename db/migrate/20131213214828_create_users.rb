class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.string :reset_password_token
      t.string :session_token

      t.boolean :admin, default: false
      t.boolean :super_admin, default: false

      t.timestamps
    end
  end
end
