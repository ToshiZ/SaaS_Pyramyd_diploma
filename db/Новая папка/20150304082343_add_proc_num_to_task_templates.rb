class AddProcNumToTaskTemplates < ActiveRecord::Migration
  def change
  	add_column :task_templates, :procNum, :integer
  end
end
