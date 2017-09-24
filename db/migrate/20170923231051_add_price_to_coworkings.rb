class AddPriceToCoworkings < ActiveRecord::Migration[5.0]
  def change
    add_monetize :coworkings, :price, currency: { present: false }
  end
end
