class AddIsPrivateToFolders < ActiveRecord::Migration
  def self.up
    add_column :folders, :is_private, :boolean
  end

  def self.down
    remove_column :folders, :is_private
  end
end
