class CreateUser < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.datetime :registered_at

      t.timestamps
    end
  end

  def down
    drop_table :users, if_exists: true
  end 
end
