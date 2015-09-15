class TwilioTokenGeneratorService

  def process
    capability = twilio_capability()
    capability.generate
  end

  private
  def twilio_capability
    capability ||= Twilio::Util::Capability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    capability.allow_client_outgoing ENV['TWILIO_CALL_APP_SID']
    capability.allow_client_incoming 'RESPECTFUL'
    capability
  end

end
