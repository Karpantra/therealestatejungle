class InfosController < ApplicationController

  def new
    @info = Info.new
    skip_authorization
  end

  def create
    @info = Info.new(params[:info])
    @info.request = request
    skip_authorization
    if @info.deliver
      flash[:notice] = nil
    else
      flash[:alert] = "Cannot send the message."
      render :new
    end
  end
end
