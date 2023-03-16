class AddAdminColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      add_column :users, :admin, :boolean, default: false
    end
  end
end
