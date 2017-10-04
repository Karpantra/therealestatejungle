class ChangePricePerMonthInCoworkings < ActiveRecord::Migration[5.0]
  def change
    change_column :coworkings, :price_per_month, :integer, :null => true
  end
end
