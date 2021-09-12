class CreateTrackingLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :tracking_logs do |t|
      t.string :event_type
      t.integer :trackeable_id
      t.string :trackeable_type
      t.integer :user_id
      t.string :ip_address
      t.json :metadata, default: {}

      t.timestamps
      t.index ["trackeable_id", "trackeable_type"], name: "index_tracking_logs_on_trackeable_id_and_trackeable_type"
      t.index ["user_id"], name: "index_tracking_logs_on_user_id"
    end
  end
end