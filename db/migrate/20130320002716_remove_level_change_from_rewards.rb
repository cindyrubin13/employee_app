class RemoveLevelChangeFromRewards < ActiveRecord::Migration
  def up
    remove_column :rewards, :level_change
  end

  def down
    add_column :rewards, :level_change, :integer
  end
end
