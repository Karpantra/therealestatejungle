class CreateCoworkingCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :coworking_categories do |t|
      t.references :coworking, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
