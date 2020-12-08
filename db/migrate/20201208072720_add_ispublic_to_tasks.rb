class AddIspublicToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :ispublic, :boolean
  end
end
