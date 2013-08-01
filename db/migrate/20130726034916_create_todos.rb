class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :description
      t.boolean :done
      t.date :due

      t.timestamps
    end
  end
end
