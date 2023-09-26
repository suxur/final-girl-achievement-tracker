class UpdateFinalGirlSeriesAssociation < ActiveRecord::Migration[7.0]
  def up
    FinalGirl.all.each do |final_girl|
      final_girl.create_series(series_id: final_girl.series_id)
    end

    remove_column :final_girls, :series_id, if_exists: true
    remove_foreign_key :final_girls, :series, if_exists: true
  end

  def down
    add_column :final_girls, :series_id, :integer
    add_foreign_key :final_girls, :series

    FinalGirlSeries.all.each do |final_girl_series|
      final_girl_series.final_girl.update(series_id: final_girl_series.series_id)
    end

    FinalGirlSeries.destroy_all
  end
end
