class Admin::LeadsController < Admin::BaseController
  respond_to :html, :json
  def index
    @leads = Lead.order(created_at: :desc).page(params[:page])
  end

  def upgrade_form
    @lead = Lead.find(params[:lead_id])
    js :index
    respond_modal_with @lead
  end

  def upgrade
    lead = Lead.find(params[:user][:lead_id])
    generated_password = Devise.friendly_token.first(8)
    user = lead.create_user!(email: params[:user][:email], password: generated_password)
    sign_in(:user, user)
    redirect_to edit_admin_user_path(user.id), trubolinks: false
  end

end
