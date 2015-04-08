class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :mqinfo
      t.text :stdout_rez
      t.text :work_status
      t.text :errors_suppz
      t.text :manager_log
      t.text :output_suppz
      t.string :status_suppz

      t.timestamps null: false
    end
  end
end
