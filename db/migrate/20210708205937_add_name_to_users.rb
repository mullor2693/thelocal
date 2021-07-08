class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :birth_date, :date
    add_column :users, :sex, :integer
    add_column :users, :phone, :string
  end
end
