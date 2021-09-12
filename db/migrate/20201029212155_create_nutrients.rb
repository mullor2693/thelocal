class CreateNutrients < ActiveRecord::Migration[6.0]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.integer :component_group

      t.timestamps
    end
  end
end
