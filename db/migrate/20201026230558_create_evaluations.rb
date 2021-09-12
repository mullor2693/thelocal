class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.decimal :height
      t.decimal :weight
      t.decimal :imc
      t.decimal :fat_rate
      t.decimal :slim_weight
      t.decimal :residual_weight
      t.decimal :muscle_weight
      t.decimal :triceps_skinfold
      t.decimal :subscapular_skinfold
      t.decimal :bicipital_skinfold
      t.decimal :axilliary_skinfold
      t.decimal :suprailiac_skinfold
      t.decimal :thoracic_skinfold
      t.decimal :abdominal_skinfold
      t.decimal :medialcalf_skinfold
      t.decimal :fist_bone_diametre
      t.decimal :femur_bone_diametre
      t.datetime :evaluation_date
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
