class AddUserToDemands < ActiveRecord::Migration[5.0]
  def change
    add_reference :demands, :user, foreign_key: true
  end
end
