class CreateJoinTableCategoryCoworking < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :coworkings do |t|
      # t.index [:category_id, :coworking_id]
      # t.index [:coworking_id, :category_id]
    end
  end
end
