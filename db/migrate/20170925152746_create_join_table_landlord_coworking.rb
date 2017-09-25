class CreateJoinTableLandlordCoworking < ActiveRecord::Migration[5.0]
  def change
    create_join_table :landlords, :coworkings do |t|
      # t.index [:landlord_id, :coworking_id]
      # t.index [:coworking_id, :landlord_id]
    end
  end
end
