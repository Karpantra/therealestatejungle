class CreateJoinTableContractCoworking < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contracts, :coworkings do |t|
      # t.index [:contract_id, :coworking_id]
      # t.index [:coworking_id, :contract_id]
    end
  end
end
