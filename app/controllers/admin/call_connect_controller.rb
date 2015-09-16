class Admin::CallConnectController < Admin::BaseController

  def index

  end

  def create
    TwilioConnector.new.call(params[:phone_1], params[:phone_2])
    redirect_to admin_root_path
  end

end
