class AddUsersSshRelate < ActiveRecord::Migration
  def change
  	create_table :users_ssh_connections, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ssh_connection, index: true
    end
  end
end
