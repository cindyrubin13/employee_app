class AddEmployeeIdToDeveloperSkills < ActiveRecord::Migration
  def change
    add_column :developer_skills, :employee_id, :integer
  end
end
