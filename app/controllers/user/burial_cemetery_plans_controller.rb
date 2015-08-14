class User::BurialCemeteryPlansController < User::BaseController
  before_action :load_user
  before_action :load_cemetery_plan, only: [ :edit, :update, :destroy]

  def new
    @passing = @user.passings.last
    @burial = @passing.burial_plans.last
    @cemetery_plan = @burial.burial_cemetery_plans.build
    if @cemetery_plan.save
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @cemetery_plan.update_attributes(cemetery_params)
    render nothing: true
    # if @burial.burial_space_owned || @burial.burial_space_owned == false
    #   respond_to do |format|
    #     format.js
    #   end
    # else
    #   render nothing: true
    # end
  end

  private

  def load_user
    @user = current_user
  end

  def load_cemetery_plan
    @cemetery_plan = BurialCemeteryPlan.find(params[:burial_cemetery_plan][:id])
  end

  def cemetery_params
    params.require(:burial_cemetery_plan).permit!
  end
end
