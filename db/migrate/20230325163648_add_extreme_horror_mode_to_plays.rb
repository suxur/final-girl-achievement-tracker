class AddExtremeHorrorModeToPlays < ActiveRecord::Migration[7.0]
  def change
    change_table :plays do |t|
      add_column :plays, :extreme_horror_mode, :boolean, default: false
    end
  end
end
