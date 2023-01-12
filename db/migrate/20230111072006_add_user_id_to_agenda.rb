class AddUserIdToAgenda < ActiveRecord::Migration[7.0]
  def up
    add_column :agendas, :user_id, :integer
    add_index :agendas, :user_id
  end

  def down
    remove_index :agendas, column: [:user_id]
  end
end
