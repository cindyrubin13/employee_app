class RemoveTotalDaysFromRewards < ActiveRecord::Migration
  def up
    remove_column :rewards, :total_days
  end

  def down
    add_column :rewards, :total_days, :integer
  end
end
