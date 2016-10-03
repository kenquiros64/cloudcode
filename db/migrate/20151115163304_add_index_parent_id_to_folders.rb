class AddIndexParentIdToFolders < ActiveRecord::Migration
  def change
    add_index :folders, :parent_id
  end
end
