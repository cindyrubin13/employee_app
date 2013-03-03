class AddLevelToDeveloperSkills1 < ActiveRecord::Migration
  def change
    add_column :developer_skills, :level, :integer
  end
end
