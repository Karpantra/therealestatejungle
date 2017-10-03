class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user

    @chat_rooms = policy_scope(ChatRoom)
    @chat_rooms = current_user.chat_rooms
  end
end
