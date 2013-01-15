class AddCurrentSkillToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :current_skill, :string
  end
end
