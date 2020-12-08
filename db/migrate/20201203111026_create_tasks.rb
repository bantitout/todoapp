class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_descption
      t.date :start_date
      t.date :due_date
      t.string :estimate_time
      t.string :priority_scale
      t.timestamps
    end
  end
end
