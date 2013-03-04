class AddSkillIdToDesiredSkills < ActiveRecord::Migration
  def change
    add_column :desired_skills, :skill_id, :integer
  end
end
