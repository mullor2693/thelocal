class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.decimal :shoulder
      t.decimal :pecs
      t.decimal :right_arm
      t.decimal :left_arm
      t.decimal :right_forearm
      t.decimal :left_forearm
      t.decimal :waist
      t.decimal :hip
      t.decimal :right_leg
      t.decimal :left_leg
      t.decimal :right_twin
      t.decimal :left_twin
      t.datetime :evaluation_date
      t.text :notes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
