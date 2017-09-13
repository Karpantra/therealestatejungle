class RenameColumnLocationInTableDemandsToLocation1 < ActiveRecord::Migration[5.0]
  def change
    rename_column :demands, :location, :location_1
  end
end
