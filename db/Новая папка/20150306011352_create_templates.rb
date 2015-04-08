class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :taskName
      t.string :taskDescription
      t.string :passportName
      t.string :name
      t.integer :procNum
      t.integer :maxTime
      t.boolean :historyenabled
      t.string :description
      t.integer :stopcode
      t.integer :resultcode
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
      t.string :otherParams

      t.timestamps null: false
    end
  end
end
