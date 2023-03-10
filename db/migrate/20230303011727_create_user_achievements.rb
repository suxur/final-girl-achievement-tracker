class CreateUserAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :user_killer_achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :killer_achievement, null: false, foreign_key: true
      t.references :location, null: true, foreign_key: true
      t.boolean :completed, null: false, default: false
      t.timestamps
    end

    create_table :user_location_achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location_achievement, null: false, foreign_key: true
      t.references :killer, null: true, foreign_key: true
      t.boolean :completed, null: false, default: false
      t.timestamps
    end
  end
end
