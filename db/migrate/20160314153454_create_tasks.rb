class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :pid
      t.text :task
      t.integer :priority
      t.datetime :deadline
      t.boolean :done

      t.timestamps null: false
    end
  end
end
