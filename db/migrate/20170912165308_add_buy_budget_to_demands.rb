class AddBuyBudgetToDemands < ActiveRecord::Migration[5.0]
  def change
    add_column :demands, :buy_budget, :integer
  end
end
