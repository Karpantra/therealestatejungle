class DemandsController < ApplicationController
  before_action :authenticate_user!

  def index
    @demands = policy_scope(Demand)
  end

  def new
    @demand = Demand.new
    authorize @demand
  end

  def create
    @demand = Demand.new(demand_params)
    @demand.user = current_user
    authorize @demand
      if @demand.save
        # DemandMailer.creation_confirmation(@demand).deliver_now
        flash[:notice] = "Votre cahier des charges a bien été enregistré"
        redirect_to dashboard_users_path
      else
      render :new
    end
  end

 def edit
   @demand = Demand.find(params[:id])
   authorize @demand
 end

 def update
   @demand = Demand.find(params[:id])
   authorize @demand
   if @demand.update(demand_params)
    # DemandMailer.modification_confirmation(@demand).deliver_now
    flash[:notice] = "Votre cahier des charges a bien été modifié"
     redirect_to dashboard_users_path
   else
     render :edit
   end
 end

 def destroy
   @demand = Demand.find(params[:id])
   authorize @demand
   if @demand.destroy
   # DemandMailer.destroy_confirmation(@demand).deliver_now
   flash[:notice] = "Votre cahier des charges a bien été supprimé"
    redirect_to dashboard_users_path
  else
    flash[:notice] = "Impossible de supprimer le cahier des charges"
    redirect_to dashboard_users_path
  end
 end

  private

  def demand_params
    params.require(:demand).permit(:lease, :buy, :leaseandbuy, :company_name, :lease_budget, :buy_budget, :location_1, :location_2, :location_3, :surface, :workstation_number, :meeting_room_number, :parking_number, :surface_type, :building_type, :move_in_date, :duration, :other_spec, :leaseandbuy, :user_id, :phone, occupation_ids:[], surface_ids:[])
  end
end
