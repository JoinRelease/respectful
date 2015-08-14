class User::BurialMausoleumPlansController < User::BaseController
  before_action :load_user
  before_action :load_mausoleum_plan, only: [ :edit, :update, :destroy]
  def new
    @passing = @user.passings.last
    @burial = @passing.burial_plans.last
    @mausoleum_plan = @burial.burial_mausoleum_plans.build
    if @mausoleum_plan.save
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @mausoleum_plan.update_attributes(mausoleum_params)
    if @burial.burial_space_owned || @burial.burial_space_owned == false
      respond_to do |format|
        format.js
      end
    else
      render nothing: true
    end
  end

  private

  def load_user
    @user = current_user
  end

  def load_mausoleum_plan
    @mausoleum_plan = BurialMausoleumPlan.find(params[:burial_mausoleum_plan][:id])
  end

  def mausoleum_params
    params.require(:burial_mausoleum_plan).permit!
  end
end
