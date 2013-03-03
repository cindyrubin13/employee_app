class RemoveCurrentSkillFromEmployees < ActiveRecord::Migration
  def up
    remove_column :employees, :current_skill
  end

  def down
    add_column :employees, :current_skill, :text
  end
end
