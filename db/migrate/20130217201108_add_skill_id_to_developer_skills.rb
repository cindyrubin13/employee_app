class AddSkillIdToDeveloperSkills < ActiveRecord::Migration
  def change
    add_column :developer_skills, :skill_id, :integer
  end
end
