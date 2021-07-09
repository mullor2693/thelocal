class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_full_event, default: false
      t.boolean :is_recurring, default: false
      t.json :recurrence, default: {}
      t.integer :creator_id
      t.integer :parent_event_id
      t.references :eventable, polymorphic: true
      t.timestamps
    end
  end
end
