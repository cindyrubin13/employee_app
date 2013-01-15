class AddSkillsInterestedInToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :skills_interested_in, :string
  end
end
