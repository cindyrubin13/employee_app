class AddSkillDaysToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :skill_days, :integer
  end
end
