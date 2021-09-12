class AddCreatorToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_reference :evaluations, :creator, index: true
    add_foreign_key :evaluations, :users, column: :creator_id
  end
end
# The migration
