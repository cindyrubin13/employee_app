class RemoveResponseIdFromRewards < ActiveRecord::Migration
  def up
    remove_column :rewards, :response_id
  end

  def down
    add_column :rewards, :response_id, :integer
  end
end
