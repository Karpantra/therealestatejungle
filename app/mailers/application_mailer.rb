class ApplicationMailer < ActionMailer::Base
  add_template_helper(EmailHelper)
  default from: 'The Real Estate Jungle <contact@therealestatejungle.fr>'
  layout 'mailer'
end
