class AddEvaluationDateToMeasurement < ActiveRecord::Migration[6.0]
  def change
    add_reference :measurements, :creator, index: true
    add_foreign_key :measurements, :users, column: :creator_id
  end
end
