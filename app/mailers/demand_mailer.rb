class DemandMailer < ApplicationMailer

  def creation_confirmation(demand)
    @demand = demand

    mail to: @demand.user.email, subject: "Votre cahier des charges a bien été créé."
  end
end
