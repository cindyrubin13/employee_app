class CreateDesiredSkills < ActiveRecord::Migration
  def change
    create_table :desired_skills do |t|
      t.string :language

      t.timestamps
    end
  end
end
