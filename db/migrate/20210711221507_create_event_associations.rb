class CreateEventAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :event_assignees do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
    create_table :event_managers do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
