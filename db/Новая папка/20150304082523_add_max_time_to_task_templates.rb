class AddMaxTimeToTaskTemplates < ActiveRecord::Migration
  def change
  	add_column :task_templates, :maxTime, :integer
  end
end
