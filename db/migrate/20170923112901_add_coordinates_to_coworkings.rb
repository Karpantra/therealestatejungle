class AddCoordinatesToCoworkings < ActiveRecord::Migration[5.0]
  def change
    add_column :coworkings, :latitude, :float
    add_column :coworkings, :longitude, :float
  end
end
