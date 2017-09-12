class RenameColumnBudgetinTableDemandstoLeaseBudget < ActiveRecord::Migration[5.0]
  def change
    rename_column :demands, :budget, :lease_budget
  end
end
