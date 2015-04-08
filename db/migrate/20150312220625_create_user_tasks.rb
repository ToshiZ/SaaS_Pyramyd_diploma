class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.string :task_name
      t.text :mqinfo
      t.text :stdout_rez
      t.text :work_status
      t.text :errors
      t.text :manager_log
      t.text :output
      t.string :status

      t.timestamps null: false
    end
  end
end
