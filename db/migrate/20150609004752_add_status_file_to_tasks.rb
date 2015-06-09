class AddStatusFileToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :statusfile, :text
  end
end
