class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string "description"
      t.datetime "due_date"
      t.integer "priorities"
      t.timestamps
    end
  end
end
