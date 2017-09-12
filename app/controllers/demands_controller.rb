class DemandsController < ApplicationController
  def new
    @demand = Demand.new
  end
end
