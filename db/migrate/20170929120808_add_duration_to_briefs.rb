class AddDurationToBriefs < ActiveRecord::Migration[5.0]
  def change
    add_column :briefs, :duration, :integer
  end
end
