class RemoveSkillDaysFromRewards < ActiveRecord::Migration
  def up
    remove_column :rewards, :skill_days
  end

  def down
    add_column :rewards, :skill_days, :integer
  end
end
