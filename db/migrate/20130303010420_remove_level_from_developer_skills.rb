class RemoveLevelFromDeveloperSkills < ActiveRecord::Migration
  def up
    remove_column :developer_skills, :level
  end

  def down
    add_column :developer_skills, :level, :integer
  end
end
