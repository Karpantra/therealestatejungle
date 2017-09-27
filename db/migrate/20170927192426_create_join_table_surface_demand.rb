class CreateJoinTableSurfaceDemand < ActiveRecord::Migration[5.0]
  def change
    create_join_table :surfaces, :demands do |t|
      # t.index [:surface_id, :demand_id]
      # t.index [:demand_id, :surface_id]
    end
  end
end
