class AddColumnsToPropositions < ActiveRecord::Migration[5.0]
  def change
    add_column :propositions, :meeting_room_number, :integer
    add_column :propositions, :other_spec, :text
  end
end
