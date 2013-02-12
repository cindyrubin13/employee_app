class AddEmployeeIdToDesiredSkills < ActiveRecord::Migration
  def change
    add_column :desired_skills, :employee_id, :integer
  end
end
