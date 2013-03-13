class AddRequestSelectionIdToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :request_selection_id, :integer
  end
end
