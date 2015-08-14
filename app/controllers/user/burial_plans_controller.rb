class User::BurialPlansController < User::BaseController
  before_action :load_user
  before_action :load_burial, only: [ :edit, :update, :destroy]


  def index

  end

  def new
    @passing = @user.passings.last
    @burial = @passing.burial_plans.build
    if @burial.save
      @burial.build_service_space_address
      @burial.build_burial_space_address
      @burial.plan_dates.build
      respond_to do |format|
        format.js
      end
    end
  end

  def create

    respond_to do |format|
      format.js
    end
  end

  def update
    @burial.update_attributes(burial_params)
    if @burial.burial_space_owned || @burial.burial_space_owned == false
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  def edit

  end

  def destroy

  end

  def show

  end

  private

  def load_user
    @user = current_user
  end

  def load_burial
    # @passing = @user.passings.last
    # if @passing.burial_plans.present?
    #   @burial = @passing.burial_plans.last
    # else
    #   @burial = @passing.burial_plans.build
    # end
    @burial = BurialPlan.find(params[:burial_plan][:id])
  end

  def burial_params
    params.require(:burial_plan).permit!
  end
end
