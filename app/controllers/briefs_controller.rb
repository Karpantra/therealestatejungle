class BriefsController < ApplicationController
   before_action :authenticate_user!

   def index
     @briefs = policy_scope(Brief)
   end

   def new
     @brief = Brief.new
     @coworking = Coworking.find(params[:coworking_id])
     authorize @brief
   end

   def create
     @brief = Brief.new(brief_params)
     @coworking = Coworking.find(params[:coworking_id])
     @brief.user = current_user
     @brief.coworking = @coworking
     coworking_params["contract_ids"].each do |contract|
      @brief.contracts << Contract.find(contract)
     end
     authorize @brief
       if @brief.save
         # briefMailer.creation_confirmation(@brief).deliver_now
         flash[:notice] = "Votre devis a bien été enregistré"
         redirect_to dashboard_users_path
       else
       render :new
     end
   end

  def edit
    @brief = Brief.find(params[:id])
    authorize @brief
  end

  def update
    @brief = Brief.find(params[:id])
    authorize @brief
    if @brief.update(brief_params)
     # BriefMailer.modification_confirmation(@brief).deliver_now
     flash[:notice] = "Votre devis a bien été modifié"
      redirect_to dashboard_users_path
    else
      render :edit
    end
  end

  def decline
    @brief = Brief.find(params[:id])
    @brief.status = "declined"
    authorize @brief
    if @brief.save
      flash[:notice] = "La demande a été déclinée"
      redirect_to dashboard_users_path
    else
      flash[:notice] = "impossible de décliner la demande"
      redirect_to dashboard_users_path
    end
  end

  def cancel
    @brief = Brief.find(params[:id])
    @brief.status = "canceled"
    authorize @brief
    if @brief.save
      flash[:notice] = "Votre demande a été annulée"
      redirect_to dashboard_users_path
    else
      flash[:notice] = "impossible d'annuler votre demande"
      redirect_to dashboard_users_path
    end
  end

  def destroy
    @brief = Brief.find(params[:id])
    authorize @brief
    if @brief.destroy
    # BriefMailer.destroy_confirmation(@brief).deliver_now
    flash[:notice] = "Votre devis a bien été supprimé"
     redirect_to dashboard_users_path
   else
     flash[:notice] = "Impossible de supprimer le devis"
     redirect_to dashboard_users_path
   end
  end

   private

   def brief_params
     params.require(:brief).permit(:company_name, :surface, :workstation_number, :meeting_room_number, :parking_number, :move_in_date, :duration, :other_spec, :user_id, :coworking_id, surface_ids:[])
   end

   def coworking_params
      params.require(:coworking).permit(contract_ids:[])
   end
end
