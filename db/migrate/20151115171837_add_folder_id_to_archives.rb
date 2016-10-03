class AddFolderIdToArchives < ActiveRecord::Migration
  def self.up 
    add_column :archives, :folder_id, :integer
    add_index :archives, :folder_id
  end
  
  def self.down 
    remove_column :archives, :folder_id
  end
end
