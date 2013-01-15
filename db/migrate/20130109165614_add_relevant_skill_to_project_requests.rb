class AddRelevantSkillToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :relevant_skill, :string
  end
end
