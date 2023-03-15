class CreatePlays < ActiveRecord::Migration[7.0]
  def change
    create_table :plays do |t|
      t.references :user, null: false, foreign_key: true
      t.references :final_girl, null: false, foreign_key: true
      t.references :killer, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.boolean :is_win, default: false

      t.timestamps
    end
  end
end
