class CreateJoinTableTypeCoworking < ActiveRecord::Migration[5.0]
  def change
    create_join_table :types, :coworkings do |t|
      # t.index [:type_id, :coworking_id]
      # t.index [:coworking_id, :type_id]
    end
  end
end
