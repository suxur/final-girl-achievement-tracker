class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :killer_achievements do |t|
      t.references :killer, null: false, foreign_key: true
      t.text :description
      t.boolean :has_locations, default: false
      t.timestamps
    end

    create_table :location_achievements do |t|
      t.references :location, null: false, foreign_key: true
      t.text :description
      t.boolean :has_killers, default: false
      t.timestamps
    end
  end
end
