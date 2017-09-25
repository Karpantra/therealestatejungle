class ChangeDefaultValuePriceMonthCoworking < ActiveRecord::Migration[5.0]
  def change
    change_column_default :coworkings, :price_per_month, nil
  end
end
