class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :concept, :tarifs]

  def home
  end

  def contact
  end

  def concept
  end

  def tarifs
  end
end
