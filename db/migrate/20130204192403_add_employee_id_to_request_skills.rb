class AddEmployeeIdToRequestSkills < ActiveRecord::Migration
  def change
    add_column :request_skills, :employee_id, :integer
  end
end
