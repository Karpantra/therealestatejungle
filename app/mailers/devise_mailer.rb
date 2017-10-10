class DeviseMailer < Devise::Mailer
  add_template_helper(EmailHelper)

  def confirmation_instructions(record, token, opts={})
    @token = token
    @resource = record
    mail template_path: 'devise/mailer', to: record.email, subject: "Confirmation de votre compte" do |format|
      format.mjml
      format.text
    end
  end
end
