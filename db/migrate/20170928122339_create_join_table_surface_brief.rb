class CreateJoinTableSurfaceBrief < ActiveRecord::Migration[5.0]
  def change
    create_join_table :surfaces, :briefs do |t|
      # t.index [:surface_id, :brief_id]
      # t.index [:brief_id, :surface_id]
    end
  end
end
