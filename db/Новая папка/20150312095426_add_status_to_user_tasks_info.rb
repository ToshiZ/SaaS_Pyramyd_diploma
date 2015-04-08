class AddStatusToUserTasksInfo < ActiveRecord::Migration
  def change
  	add_column :user_tasks_infos, :status, :string
  end
end
