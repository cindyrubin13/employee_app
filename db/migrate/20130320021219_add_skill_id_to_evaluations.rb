class AddSkillIdToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :skill_id, :integer
  end
end
