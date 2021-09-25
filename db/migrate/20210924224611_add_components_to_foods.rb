class AddComponentsToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :components, :jsonb, default: {}
    add_column :foods, :energy, :decimal, default: 0
    add_column :foods, :carbohydrates, :decimal, default: 0 
    add_column :foods, :lipids, :decimal, default: 0
    add_column :foods, :protein, :decimal, default: 0
    add_column :foods, :humidity, :decimal, default: 0
    add_column :foods, :alcohol, :decimal, default: 0
  end
end
