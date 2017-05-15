class CreateAdmins < ActiveRecord::Migration[5.1]
  def self.up
    create_table :admins do |t|
      t.string :login      
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false      
      t.timestamps
    end
  end
  def self.down
    drop_table :admins
  end
end
