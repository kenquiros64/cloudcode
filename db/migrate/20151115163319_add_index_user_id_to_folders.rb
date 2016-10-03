class AddIndexUserIdToFolders < ActiveRecord::Migration
  def change
    add_index :folders, :user_id
  end
end
