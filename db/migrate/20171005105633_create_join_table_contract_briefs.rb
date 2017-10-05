class CreateJoinTableContractBriefs < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contracts, :briefs do |t|
      # t.index [:contract_id, :brief_id]
      # t.index [:brief_id, :contract_id]
    end
  end
end
