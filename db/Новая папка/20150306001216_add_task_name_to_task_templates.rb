class AddTaskNameToTaskTemplates < ActiveRecord::Migration
  def change
  	add_column :task_templates, :taskName, :string
  end
end
