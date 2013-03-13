class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.date :reward_date
      t.integer :employee_id
      t.integer :project_request_id
      t.integer :reward_points
      t.integer :skill_id
      t.integer :level_change

      t.timestamps
    end
  end
end
