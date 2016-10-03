class AddIndexUserIdToArchives < ActiveRecord::Migration
  def change
    add_index :archives, :user_id
  end
end
