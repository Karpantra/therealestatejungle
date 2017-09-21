class CoworkingsController < ApplicationController
  def new
    @coworking = Coworking.new
  end

  def index
    @coworkings = Coworking.all
  end

  def show
  end
end
