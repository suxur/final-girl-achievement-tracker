class CreateFinalGirls < ActiveRecord::Migration[7.0]
  def change
    create_table :final_girls do |t|
      t.references :series, null: false, foreign_key: true
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
