class CreateLandlords < ActiveRecord::Migration[5.0]
  def change
    create_table :landlords do |t|
      t.string :name

      t.timestamps
    end
  end
end
