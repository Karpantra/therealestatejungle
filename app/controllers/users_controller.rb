class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user

    @coworkings = current_user.coworkings
  end
end
