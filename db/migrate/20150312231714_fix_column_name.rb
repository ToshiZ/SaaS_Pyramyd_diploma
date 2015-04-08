class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :user_tasks, :task_name, :name
  end
end
