class RemoveColumnsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :uri
  end
end
