class AddColumnsToCoworkings < ActiveRecord::Migration[5.0]
  def change
    add_column :coworkings, :price_per_workstation_per_month, :integer
    add_column :coworkings, :price_per_workstation_per_week, :integer
    add_column :coworkings, :price_per_workstation_per_day, :integer
    add_column :coworkings, :price_per_workstation_per_hour, :integer
  end
end
