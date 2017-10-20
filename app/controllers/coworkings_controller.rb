class CoworkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    # define variable for filter
    @location = filter_params[:address]
    @landlords = filter_params[:landlord]
    @surface_min = filter_params[:surface_min]
    @surface_max = filter_params[:surface_max]
    @workstation_number = filter_params[:workstation_number]
    @results = policy_scope(Coworking).where.not(latitude: nil, longitude: nil).count

    # filter by location
    if @location.present?
      @coworkings = policy_scope(Coworking).near(@location,20).where.not(latitude: nil, longitude: nil)
    else
      @coworkings = policy_scope(Coworking).where.not(latitude: nil, longitude: nil)
    end

    # filter by landlords
    unless @landlords.nil? || @landlords.join == ""
      @coworkings = @coworkings.joins(:landlords).where(landlords: {id: @landlords}).uniq
    end

    # filter by surface
    unless @surface_min.nil? || @surface_min == ""
      @coworkings = @coworkings.where("surface >= ?", @surface_min)
    end
    unless @surface_max.nil? || @surface_max == ""
      @coworkings = @coworkings.where("surface <= ?", @surface_max)
    end

    # filter by workstation_number
    unless @workstation_number.nil? || @workstation_number == ""
      @coworkings = @coworkings.where("workstation_number >= ?", @workstation_number)
    end

    # render map
    @hash = Gmaps4rails.build_markers(@coworkings) do |coworking, marker|
      marker.lat coworking.latitude
      marker.lng coworking.longitude
      marker.infowindow render_to_string(partial: "/coworkings/map_box", locals: { coworking: coworking })
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
      if @coworking.user.provider == "linkedin"
        @coworking.user.owner = true
        @coworking.user.save
      end
      # coworkingMailer.creation_confirmation(@coworking).deliver_now #uncomment to run
      flash[:notice] = "Votre espace a bien été créé"
      redirect_to coworking_path(@coworking)
    else
      render :new
    end
  end

  def show
    @coworking = Coworking.find(params[:id])
    @brief = Brief.new
    @schedule = Schedule.new
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
     # coworkingMailer.modification_confirmation(@coworking).deliver_now #uncomment to run
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
    # coworkingMailer.destroy_confirmation(@coworking).deliver_now #uncomment to run
    flash[:notice] = "Votre annonce a bien été supprimée"
     redirect_to root_path
   else
     flash[:notice] = "Impossible de supprimer votre annonce"
     redirect_to coworking_path(@coworking)
   end
  end

  private

  def coworking_params
      params.require(:coworking).permit(:user_id, :title, :name, :address, :city, :zip_code, :surface, :workstation_number, :price_per_month, :price_per_workstation_per_month, :price_per_workstation_per_day, :price_per_workstation_per_hour, :description, :special_offer, photos: [], category_ids:[], contract_ids:[], type_ids:[], landlord_ids:[])
  end

  def filter_params
      params.require(:coworking).permit(:address, :surface_min, :surface_max, :workstation_number, landlord:[])
  end
end
