class RenameColumnZipInCoworkings < ActiveRecord::Migration[5.0]
  def change
    rename_column :coworkings, :zip, :zip_code
  end
end
