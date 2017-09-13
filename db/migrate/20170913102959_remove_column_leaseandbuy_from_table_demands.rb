class RemoveColumnLeaseandbuyFromTableDemands < ActiveRecord::Migration[5.0]
  def change
    remove_column :demands, :leaseandbuy
  end
end
