class ApplicationMailer < ActionMailer::Base
  helper :application # gives access to all helpers defined within `application_helper`.
   include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
   default template_path: 'devise/mailer'
  default from: 'contact@therealestatejungle.fr'
  layout 'mailer'
end
