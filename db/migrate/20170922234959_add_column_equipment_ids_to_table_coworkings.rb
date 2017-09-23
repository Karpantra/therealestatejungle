class AddColumnEquipmentIdsToTableCoworkings < ActiveRecord::Migration[5.0]
  def change
    add_column :coworkings, :equipment_ids, :string, array: true, default: []
  end
end
