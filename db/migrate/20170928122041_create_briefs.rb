class CreateBriefs < ActiveRecord::Migration[5.0]
  def change
    create_table :briefs do |t|
      t.string :company_name
      t.integer :surface
      t.integer :workstation_number
      t.integer :meeting_room_number
      t.integer :parking_number
      t.string :move_in_date
      t.text :other_spec
      t.references :user, foreign_key: true
      t.references :coworking, foreign_key: true

      t.timestamps
    end
  end
end
