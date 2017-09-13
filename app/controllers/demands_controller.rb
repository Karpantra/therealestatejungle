class DemandsController < ApplicationController
  def new
    @demand = Demand.new
  end

  def create
    @demand = Demand.new(demand_params)
    @demand.user = current_user
      if @demand.save
        flash[:notice] = "Votre cahier des charges a bien été enregistré"
        redirect_to root_path
      else
      render :new
    end
  end

  def index
    @demand = Demand.all
  end

  private

  def demand_params
    params.require(:demand).permit(:lease, :buy, :leaseandbuy, :company_name, :lease_budget, :buy_budget, :location_1, :location_2, :location_3, :surface, :workstation_number, :meeting_room_number, :parking_number, :surface_type, :building_type, :move_in_date, :other_spec, :leaseandbuy, :user_id)
  end
end
