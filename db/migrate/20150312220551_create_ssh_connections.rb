class CreateSshConnections < ActiveRecord::Migration
  def change
    create_table :ssh_connections do |t|
      t.string :name
      t.string :ip
      t.string :login

      t.timestamps null: false
    end
  end
end
