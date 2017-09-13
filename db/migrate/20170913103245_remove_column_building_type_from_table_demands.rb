class RemoveColumnBuildingTypeFromTableDemands < ActiveRecord::Migration[5.0]
  def change
    remove_column :demands, :building_type
  end
end
