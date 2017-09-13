class AddleaseandbuyToDemands < ActiveRecord::Migration[5.0]
  def change
    add_column :demands, :leaseandbuy, :boolean
  end
end
