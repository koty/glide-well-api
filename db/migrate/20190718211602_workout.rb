class Workout < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.references :user, foreign_key: true, null: false
      t.date :date, :null => false
      t.string :kind, :null => false
      t.timestamp :timestamps, :null => false
      t.text :impression, null: true
    end
  end
end
