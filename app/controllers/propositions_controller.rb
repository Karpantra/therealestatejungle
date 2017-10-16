class PropositionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @proposition = Proposition.new
    @brief = Brief.find(params[:brief_id])
    skip_authorization
  end

  def create
    @proposition = Proposition.new(proposition_params)
    @brief = Brief.find(params[:brief_id])
    @brief.status = "answered"
    @brief.save
    @proposition.brief = @brief
    skip_authorization
      if @proposition.save
        # PropositionMailer.creation_confirmation(@proposition).deliver_now
        flash[:notice] = "Votre proposition a bien été envoyée"
        redirect_to dashboard_users_path
      else
      render :new
    end
  end

  def edit
    @proposition = Proposition.find(params[:id])
    @brief = Brief.find(params[:brief_id])
    skip_authorization
  end

  def update
    proposition = Proposition.find(params[:id])
    @brief = Brief.find(params[:brief_id])
    skip_authorization
    if proposition.update(proposition_params)
     # PropositionMailer.modification_confirmation(@proposition).deliver_now
     flash[:notice] = "Votre proposition a bien été modifiée"
      redirect_to dashboard_users_path
    else
      render :edit
    end
  end

  def decline
    @proposition = Proposition.find(params[:id])
    @proposition.status = "declined"
    skip_authorization
    if @proposition.save
      flash[:notice] = "Vous avez décliné la proposition"
      redirect_to dashboard_users_path
    else
      flash[:notice] = "Un problème est survenu, merci de nous contacter"
      redirect_to dashboard_users_path
    end
  end

  def cancel
    @proposition = Proposition.find(params[:id])
    @proposition.status = "canceled"
    skip_authorization
    if @proposition.save
      flash[:notice] = "Votre proposition a été annulée"
      redirect_to dashboard_users_path
    else
      flash[:notice] = "impossible d'annuler votre proposition"
      redirect_to dashboard_users_path
    end
  end

  def accept
    @proposition = Proposition.find(params[:id])
    @proposition.status = "accepted"
    skip_authorization
    if @proposition.save
      flash[:notice] = "La proposition a bien été acceptée"
      redirect_to dashboard_users_path
    else
      flash[:notice] = "Une erreur s'est produite, merci de nous contacter"
      redirect_to dashboard_users_path
    end
  end

  def destroy
    @proposition = Proposition.find(params[:id])
    skip_authorization
    if @proposition.destroy
    # PropositionMailer.destroy_confirmation(@proposition).deliver_now
    flash[:notice] = "Votre proposition a bien été supprimée"
     redirect_to dashboard_users_path
   else
     flash[:notice] = "Impossible de supprimer la proposition"
     redirect_to dashboard_users_path
   end
  end

  private

  def proposition_params
    params.require(:proposition).permit(:workstation_number, :office_surface, :storage_surface, :parking_number, :lease_start, :mad_start, :office_charge_per_sqm, :office_rent_per_sqm, :office_taxe_per_sqm, :office_teom_per_sqm, :workstation_price_per_month, :workstation_price_per_day, :workstation_price_per_hour, :storage_price_per_sqm, :parking_price_per_unit, :indexation, :fiscal_status, :deposit, :lease_duration, :fitout_allowance_in_month, :free_rent_in_month, :brief_id, :meeting_room_number, :other_spec, :status)
  end
end
