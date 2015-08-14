class User::CremationPlansController < User::BaseController
  before_action :load_user
  before_action :load_cremation, only: [:edit, :update, :destroy]

  def index

  end

  def new
    @passing = @user.passings.last
    @cremation = @passing.cremation_plans.build
    if @cremation.save
      respond_to do |format|
        @cremation.build_service_space_address
        @cremation.build_ash_storage_address
        @cremation.build_ash_delivery_address
        @cremation.plan_dates.build
        format.js
      end
    end
  end

  def update
    @cremation.update_attributes(cremation_params)


    render nothing: true
  end

  private

  def load_user
    @user = current_user
  end

  def load_cremation
    @cremation = CremationPlan.find(params[:cremation_plan][:id])
  end

  def cremation_params
    params.require(:cremation_plan).permit!
  end

end
