class CreateRequestSkills < ActiveRecord::Migration
  def change
    create_table :request_skills do |t|
      t.string :language

      t.timestamps
    end
  end
end
