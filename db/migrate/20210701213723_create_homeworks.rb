class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
