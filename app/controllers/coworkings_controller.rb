class CoworkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new]

  def index
    # @coworkings = Coworking.all
    @coworkings = policy_scope(Coworking).where.not(latitude: nil, longitude: nil)
    # @coworkings = Coworking.where.not(latitude: nil, longitude: nil) #pundit

    @hash = Gmaps4rails.build_markers(@coworkings) do |coworking, marker|
      marker.lat coworking.latitude
      marker.lng coworking.longitude
      # marker.infowindow render_to_string(partial: "/coworkings/map_box", locals: { coworking: coworking })
    end
  end

  def new
    @coworking = Coworking.new
    authorize @coworking
  end

  def create
    @coworking = Coworking.new(coworking_params)
    @coworking.user = current_user
    authorize @coworking
    if @coworking.save
      # coworkingMailer.creation_confirmation(@coworking).deliver_now
      flash[:notice] = "Votre espace a bien été créé"
      redirect_to coworking_path(@coworking)
    else
      render :new
    end
  end

  def show
    @coworking = Coworking.find(params[:id])
    authorize @coworking
        @hash = Gmaps4rails.build_markers(@coworking) do |coworking, marker|
      marker.lat coworking.latitude
      marker.lng coworking.longitude
    end
  end

  def edit
    @coworking = Coworking.find(params[:id])
    authorize @coworking
  end

  def update
    @coworking = Coworking.find(params[:id])
    authorize @coworking
    if @coworking.update(coworking_params)
     # coworkingMailer.modification_confirmation(@coworking).deliver_now
     flash[:notice] = "Votre annonce a bien été modifiée"
      redirect_to coworking_path(@coworking)
    else
      render :edit
    end
  end

  def destroy
    @coworking = Coworking.find(params[:id])
    authorize @coworking
    if @coworking.destroy
    # coworkingMailer.destroy_confirmation(@coworking).deliver_now
    flash[:notice] = "Votre annonce a bien été supprimée"
     redirect_to coworkings_path
   else
     flash[:notice] = "Impossible de supprimer votre annonce"
     redirect_to coworking_path(@coworking)
   end
  end

  private

  def coworking_params
      params.require(:coworking).permit(:user_id, :title, :name, :address, :city, :zip_code, :surface, :workstation_number, :price_per_month, :price_per_workstation_per_month, :price_per_workstation_per_day, :price_per_workstation_per_hour, :description, :special_offer, photos: [], category_ids:[], contract_ids:[], type_ids:[], landlord_ids:[])
  end
end
#   def coworking_params
#     params.require(:coworking).permit(:title, :name, :address, :zip_code, :city, :surface, :workstation_number, :description, :special_offer, :user_id, :tv, :erp_room, :auditorium, :kitchen, :nap_zone, :terrace, :internet, :photocopier, :shower, :locker, :garden, :rj45_socket, :optical_fiber, :storage, :furniture, :ohp, :phone, :cooling_system, :alarm, :board, :computer, :waiting_room, :fax, :disabled_access, :bar, :lift, :common_space, :local_bike, :parking, :discretionnary_coffee, :cleaning_service, :welcome_desk_service, :mail_management_service, :office_supplies, :latitude, :longitude, :price_cents, photos: [])
#   end
# end

# Controller for simple form with js choice for equipment

# class CoworkingsController < ApplicationController
#   skip_before_action :authenticate_user!, only: [ :index, :new]

#   def index
#     @coworkings = Coworking.all
#   end

#   def new
#     @coworking = Coworking.new
#   end

#   def create
#     @coworking = Coworking.new(coworking_params)
#     @coworking.user = current_user
#     if @coworking.save
#       # coworkingMailer.creation_confirmation(@coworking).deliver_now
#       flash[:notice] = "Votre espace a bien été créé"
#       redirect_to coworking_path(@coworking)
#     else
#       render new
#     end

#   end

#   def show
#     @coworking = Coworking.find(params[:id])
#   end

#   private

#   def coworking_params
#     params.require(:coworking).permit(:title, :name, :address, :zip, :city, :surface, :workstation_number, :description, :special_offer, :user_id, :equipment_ids, photos: [])
#   end
# end
