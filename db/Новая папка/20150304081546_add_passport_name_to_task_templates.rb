class AddPassportNameToTaskTemplates < ActiveRecord::Migration
  def change
  	add_column :task_templates, :passportName, :string
  end
end
