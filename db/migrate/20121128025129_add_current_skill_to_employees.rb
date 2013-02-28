class AddCurrentSkillToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :current_skill, :text
  end
end
