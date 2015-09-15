class Admin::CallsController < Admin::BaseController
  before_action :set_twilio_token, only: [:index]
  skip_before_filter :authenticate_admin, only: [:create_call]

  def index
  end

  def create_call
    response_to_twilio_callback = TwilioCallTwiMLGeneratorService.new(call_params[:phone_number]).process
    render xml: response_to_twilio_callback
  end

  def call_params
    params.permit(:phone_number)
  end

  def set_twilio_token
    @twilio_token = TwilioTokenGeneratorService.new.process
  end

end
