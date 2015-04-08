class AddOutputStatusSuppzToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :output_status_suppz, :string
  end
end
