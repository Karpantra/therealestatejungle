class RenameColumnTypeFromSurfaces < ActiveRecord::Migration[5.0]
  def change
    rename_column :surfaces, :type, :space
  end
end
