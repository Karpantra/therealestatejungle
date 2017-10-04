class AddStatusToPropositions < ActiveRecord::Migration[5.0]
  def change
    add_column :propositions, :status, :string, default: "pending"
  end
end
