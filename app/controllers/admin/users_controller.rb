class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: [:edit, :update, :destroy, :show]

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def edit
    js :new
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "#{@user.full_name} saved"
      redirect_to [:admin, @user]
    else
      render :edit
    end
  end

  def destroy

  end

  def show
    js :new
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end
