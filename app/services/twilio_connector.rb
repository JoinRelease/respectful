class TwilioConnector

  def initialize
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def call(num1, num2)
    @call = @client.account.calls.create(
      from: ENV['TWILIO_VERIFIED_NUMBER'],   # From your Twilio number
      to: num1,     # To any number
      # Fetch instructions from this URL when the call connects
      url: 'http://twimlets.com/forward?PhoneNumber=' + num2
    )
  end
end
