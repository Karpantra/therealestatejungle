class DemandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  before_action :authenticate_user!, only: [:create]
  def new
    @demand = Demand.new
  end

  def create
    @demand = Demand.new(demand_params)
    @demand.user = current_user
      if @demand.save
        # DemandMailer.creation_confirmation(@demand).deliver_now
        flash[:notice] = "Votre cahier des charges a bien été enregistré"
        redirect_to root_path
      else
      render :new
    end
  end

  def index
    @demand = Demand.all
  end

 def edit
   @demand = Demand.find(params[:id])
 end

 def update
   @demand = Demand.find(params[:id])
   if @demand.update(demand_params)
    # DemandMailer.modification_confirmation(@demand).deliver_now
    flash[:notice] = "Votre cahier a bien été modifié"
     redirect_to user_demands_path(@demand.user_id)
   else
     render :edit
   end
 end

 def destroy
   @demand = Demand.find(params[:id])
   if @demand.destroy
   # DemandMailer.destroy_confirmation(@demand).deliver_now
   flash[:notice] = "Votre cahier des charges a bien été supprimé"
    redirect_to user_demands_path(@demand.user_id)
  else
    flash[:notice] = "Impossible de supprimer le cahier des charges"
    redirect_to user_demands_path(@demand.user_id)
  end
 end

  private

  def demand_params
    params.require(:demand).permit(:lease, :buy, :leaseandbuy, :company_name, :lease_budget, :buy_budget, :location_1, :location_2, :location_3, :surface, :workstation_number, :meeting_room_number, :parking_number, :surface_type, :building_type, :move_in_date, :other_spec, :leaseandbuy, :user_id)
  end
end
