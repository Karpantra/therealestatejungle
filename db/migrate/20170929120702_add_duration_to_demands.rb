class AddDurationToDemands < ActiveRecord::Migration[5.0]
  def change
    add_column :demands, :duration, :integer
  end
end
