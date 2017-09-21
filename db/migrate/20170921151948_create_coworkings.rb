class CreateCoworkings < ActiveRecord::Migration[5.0]
  def change
    create_table :coworkings do |t|
      t.string :title
      t.string :name
      t.string :address
      t.string :zip
      t.string :city
      t.integer :surface
      t.integer :workstation_number
      t.text :description
      t.string :special_offer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
