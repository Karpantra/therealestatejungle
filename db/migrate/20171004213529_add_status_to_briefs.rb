class AddStatusToBriefs < ActiveRecord::Migration[5.0]
  def change
    add_column :briefs, :status, :string, default: "pending"
  end
end
