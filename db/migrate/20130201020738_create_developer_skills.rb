class CreateDeveloperSkills < ActiveRecord::Migration
  def change
    create_table :developer_skills do |t|
      t.string :language

      t.timestamps
    end
  end
end
