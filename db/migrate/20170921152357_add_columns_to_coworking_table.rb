class AddColumnsToCoworkingTable < ActiveRecord::Migration[5.0]
  def change
    add_column :coworkings, :tv, :boolean
    add_column :coworkings, :erp_room, :boolean
    add_column :coworkings, :auditorium, :boolean
    add_column :coworkings, :kitchen, :boolean
    add_column :coworkings, :nap_zone, :boolean
    add_column :coworkings, :terrace, :boolean
    add_column :coworkings, :internet, :boolean
    add_column :coworkings, :photocopier, :boolean
    add_column :coworkings, :shower, :boolean
    add_column :coworkings, :locker, :boolean
    add_column :coworkings, :garden, :boolean
    add_column :coworkings, :rj45_socket, :boolean
    add_column :coworkings, :optical_fiber, :boolean
    add_column :coworkings, :storage, :boolean
    add_column :coworkings, :furniture, :boolean
    add_column :coworkings, :ohp, :boolean
    add_column :coworkings, :phone, :boolean
    add_column :coworkings, :cooling_system, :boolean
    add_column :coworkings, :alarm, :boolean
    add_column :coworkings, :board, :boolean
    add_column :coworkings, :computer, :boolean
    add_column :coworkings, :waiting_room, :boolean
    add_column :coworkings, :fax, :boolean
    add_column :coworkings, :disabled_access, :boolean
    add_column :coworkings, :bar, :boolean
    add_column :coworkings, :lift, :boolean
    add_column :coworkings, :common_space, :boolean
    add_column :coworkings, :local_bike, :boolean
    add_column :coworkings, :parking, :boolean
    add_column :coworkings, :discretionnary_coffee, :boolean
    add_column :coworkings, :cleaning_service, :boolean
    add_column :coworkings, :welcome_desk_service, :boolean
    add_column :coworkings, :mail_management_service, :boolean
    add_column :coworkings, :office_supplies, :boolean
  end
end
