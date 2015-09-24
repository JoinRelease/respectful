class Admin::BurialPlansController < Admin::BaseController
  before_action :load_burial, only: [:edit, :update, :destroy, :show]

  def new
    @passing = Passing.find(params[:passing_id])
    @burial = @passing.burial_plans.build
  end

  def edit

  end

  def update
    if @burial.update_attributes(burial_params)
      flash[:success] = "Burial Plan saved"
      redirect_to admin_user_path(@burial.passing.user)
    else
      render :edit
    end
  end

  private

  def load_burial
    @burial = BurialPlan.find(params[:id])
  end

  def burial_params
    params.require(:burial_plan).permit!
  end
end
