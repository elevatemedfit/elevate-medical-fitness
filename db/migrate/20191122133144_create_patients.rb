class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.datetime :date
      t.string :physician
      t.string :condition
      t.integer :height
      t.integer :weight
      t.integer :step_count
      t.integer :cardio_fitness_level
      t.integer :caloric_burn
      t.integer :distance
      t.integer :active_minutes
      t.string :precautions

      t.timestamps
    end
  end
end
