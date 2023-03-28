class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      add_column :users, :username, :string, null: true
    end
  end
end
