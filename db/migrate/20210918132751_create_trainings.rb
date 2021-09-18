class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    add_column :workouts, :training_id, :integer
  end
end
