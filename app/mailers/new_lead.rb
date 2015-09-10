class NewLead < ApplicationMailer
  default from: "bot@joinrespectful.com"

  def send_notification(lead)
    @lead = lead
    mail(to: 'tai@joinrespectful.com', subject: 'A new lead has been created')
  end
end
