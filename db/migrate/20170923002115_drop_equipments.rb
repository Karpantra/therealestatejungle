class DropEquipments < ActiveRecord::Migration[5.0]
  def change
    drop_table :equipments
  end
end
