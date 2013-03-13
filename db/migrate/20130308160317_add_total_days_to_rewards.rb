class AddTotalDaysToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :total_days, :integer
  end
end
