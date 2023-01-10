class CreateAgendas < ActiveRecord::Migration[7.0]
  def change
    create_table :agendas do |t|
      t.string :title
      t.text :desc
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
