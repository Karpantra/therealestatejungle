class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user
  end

  def index
    if params[:query].blank?
      @users = []
    else
      @users = User.where("first_name ILIKE ?", "#{params[:query]}%").where.not(id: current_user.id)
    end
  end
end
