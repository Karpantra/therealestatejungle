class CoworkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new]

  def index
    @coworkings = Coworking.all
  end

  def new
    @coworking = Coworking.new
  end

  def create
    @coworking = Coworking.new(coworking_params)
    @coworking.user = current_user
    if @coworking.save
      # coworkingMailer.creation_confirmation(@coworking).deliver_now
      flash[:notice] = "Votre espace a bien été créé"
      redirect_to coworking_path(@coworking)
    else
      render new
    end

  end

  def show
  end

  private

  def coworking_params
    params.require(:coworking).permit(:title, :name, :address, :zip, :city, :surface, :workstation_number, :description, :special_offer, :user_id, :tv, :erp_room, :auditorium, :kitchen, :nap_zone, :terrace, :internet, :photocopier, :shower, :locker, :garden, :rj45_socket, :optical_fiber, :storage, :furniture, :ohp, :phone, :cooling_system, :alarm, :board, :computer, :waiting_room, :fax, :disabled_access, :bar, :lift, :common_space, :local_bike, :parking, :discretionnary_coffee, :cleaning_service, :welcome_desk_service, :mail_management_service, :office_supplies, photos: [])
  end
end
