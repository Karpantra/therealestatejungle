class CreateCoworkingEquipments < ActiveRecord::Migration[5.0]
  def change
    create_table :coworking_equipments do |t|
      t.references :coworking, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
