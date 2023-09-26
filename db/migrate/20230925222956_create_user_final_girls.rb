class CreateUserFinalGirls < ActiveRecord::Migration[7.0]
  def change
    create_table :user_final_girls do |t|
      t.references :user
      t.references :final_girl
      t.timestamps
    end
  end
end
