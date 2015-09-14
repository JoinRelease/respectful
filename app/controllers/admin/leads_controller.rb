class Admin::LeadsController < Admin::BaseController

  def index
    @leads = Lead.order(created_at: :desc).page(params[:page])
  end

end
