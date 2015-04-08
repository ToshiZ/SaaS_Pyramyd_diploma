class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.string :fileName
      t.string :taskName

      t.timestamps null: false
    end
  end
end
