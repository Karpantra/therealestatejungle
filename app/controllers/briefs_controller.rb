class BriefsController < ApplicationController
   before_action :authenticate_user!, except: [:new]

   def index
     @briefs = policy_scope(Brief)
   end

   def new
     @brief = Brief.new
     @coworking = Coworking.find(params[:coworking_id])
     authorize @brief
   end

   def create
    binding.pry
     @brief = Brief.new(brief_params)
     @coworking = Coworking.find(params[:coworking_id])
     @brief.user = current_user
     @brief.coworking = @coworking
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
     params.require(:brief).permit(:company_name, :surface, :workstation_number, :meeting_room_number, :parking_number, :move_in_date, :other_spec, :user_id, :coworking_id, surface_ids:[])
   end
end
