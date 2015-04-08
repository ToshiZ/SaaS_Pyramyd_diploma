class CreateTaskTemplates < ActiveRecord::Migration
  def change
    create_table :task_templates do |t|
      t.string :name
      t.boolean :historyenabled
      t.string :description
      t.string :stopcode
      t.string :resultcode
      t.string :dir
      t.boolean :nfs
      t.integer :checkpoint
      t.string :logPath
      t.boolean :logNfs
      t.boolean :logEpk
      t.boolean :logCluster
      t.boolean :logNode
      t.integer :portionCluster
      t.integer :portionNode
      t.integer :portionProgram
      t.string :parameters
      t.string :parametersDescription
      t.string :profiles
      t.string :profilesDescription
      t.string :passportName
      t.integer :procNum
      t.integer :maxTime
      t.string :taskName
      t.integer :userId

      t.timestamps null: false
    end
  end
end
