class AddProjectRequestIdToRequestSkills < ActiveRecord::Migration
  def change
    add_column :request_skills, :project_request_id, :integer
  end
end
