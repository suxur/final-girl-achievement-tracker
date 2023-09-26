class CreateFinalGirlSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :final_girl_series do |t|
      t.references :final_girl
      t.references :series
      t.timestamps
    end
  end
end
