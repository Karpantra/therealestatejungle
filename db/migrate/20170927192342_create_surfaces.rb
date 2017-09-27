class CreateSurfaces < ActiveRecord::Migration[5.0]
  def change
    create_table :surfaces do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
