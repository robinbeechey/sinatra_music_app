class RemoveUser < ActiveRecord::Migration
  def change
    remove_column :users, :title
    remove_column :users, :author
    remove_column :users, :url
  end
end
