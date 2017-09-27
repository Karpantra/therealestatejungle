class CreateJoinTableOccupationDemand < ActiveRecord::Migration[5.0]
  def change
    create_join_table :occupations, :demands do |t|
      # t.index [:occupation_id, :demand_id]
      # t.index [:demand_id, :occupation_id]
    end
  end
end
