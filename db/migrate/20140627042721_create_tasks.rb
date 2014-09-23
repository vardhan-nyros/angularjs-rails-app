class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :start
      t.date :end
      t.integer :assignee_id
      t.integer :list_id

      t.timestamps
    end
  end
end
