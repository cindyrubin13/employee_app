class RemoveRewardPointsFromRewards < ActiveRecord::Migration
  def up
    remove_column :rewards, :reward_points
  end

  def down
    add_column :rewards, :reward_points, :integer
  end
end
