class RenamePriceCentsToPricePerMonthInCoworkings < ActiveRecord::Migration[5.0]
  def change
    rename_column :coworkings, :price_cents, :price_per_month
  end
end
