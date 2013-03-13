class AddResponseIdToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :response_id, :integer
  end
end
