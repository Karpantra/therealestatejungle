class AddColumnsToTableDemands < ActiveRecord::Migration[5.0]
  def change
    add_column :demands, :location_2, :string
    add_column :demands, :location_3, :string
  end
end
