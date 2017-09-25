class RemoveColumnsFromCoworkings < ActiveRecord::Migration[5.0]
  def change
    remove_column :coworkings, :tv
    remove_column :coworkings, :erp_room
    remove_column :coworkings, :auditorium
    remove_column :coworkings, :kitchen
    remove_column :coworkings, :nap_zone
    remove_column :coworkings, :terrace
    remove_column :coworkings, :internet
    remove_column :coworkings, :photocopier
    remove_column :coworkings, :shower
    remove_column :coworkings, :locker
    remove_column :coworkings, :garden
    remove_column :coworkings, :rj45_socket
    remove_column :coworkings, :optical_fiber
    remove_column :coworkings, :storage
    remove_column :coworkings, :furniture
    remove_column :coworkings, :ohp
    remove_column :coworkings, :phone
    remove_column :coworkings, :cooling_system
    remove_column :coworkings, :alarm
    remove_column :coworkings, :board
    remove_column :coworkings, :computer
    remove_column :coworkings, :waiting_room
    remove_column :coworkings, :fax
    remove_column :coworkings, :disabled_access
    remove_column :coworkings, :bar
    remove_column :coworkings, :lift
    remove_column :coworkings, :common_space
    remove_column :coworkings, :local_bike
    remove_column :coworkings, :parking
    remove_column :coworkings, :discretionnary_coffee
    remove_column :coworkings, :cleaning_service
    remove_column :coworkings, :welcome_desk_service
    remove_column :coworkings, :mail_management_service
    remove_column :coworkings, :office_supplies
  end
end
