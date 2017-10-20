class SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
    @coworking = Coworking.find(params[:coworking_id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @coworking = Coworking.find(params[:coworking_id])
    @schedule.coworking = @coworking
    skip_authorization
      if @schedule.save
        # scheduleMailer.creation_confirmation(@schedule).deliver_now
        flash[:notice] = "Votre calendrier a bien été enregistré"
        redirect_to coworking_path(@coworking)
      else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    skip_authorization
  end

  def update
    @schedule = Schedule.find(params[:id])
      if @schedule.update(schedule_params)
        # scheduleMailer.creation_confirmation(@schedule).deliver_now
        flash[:notice] = "Votre calendrier a bien été mis à jour"
        redirect_to coworking_path(@coworking)
      else
      render :edit
    end
  end


  private

  def schedule_params
    params.require(:schedule).permit(:mond_start, :mond_end, :tue_start, :tue_end, :wed_start, :wed_end, :thu_start, :thu_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end, :no_stop, :coworking_id)
  end
end
