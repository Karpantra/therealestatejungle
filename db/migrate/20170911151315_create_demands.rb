class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
      t.boolean :lease
      t.boolean :buy
      t.string :company_name
      t.integer :budget
      t.string :location
      t.integer :surface
      t.integer :workstation_number
      t.integer :meeting_room_number
      t.integer :parking_number
      t.string :surface_type
      t.string :building_type
      t.string :move_in_date
      t.text :other_spec

      t.timestamps
    end
  end
end
