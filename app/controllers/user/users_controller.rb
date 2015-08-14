class User::UsersController < User::BaseController

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.registered = true
    @user.update_attributes(user_params)

    respond_to do |format|
      format.js
    end
  end

  # def final_registration
  #   respond_to do |format|
  #     format.js { render 'registration.js.erb'}
  #   end
  # end

  def registration
    @user = current_user
    if @user.passings.present?
      @passing = @user.passings.last
    else
      @passing = @user.passings.build
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :phone_number, passings_attributes:[:first_name, :last_name, :relation, :date_of_birth, :date_of_passing, :location_of_passing, :address_of_passing])
  end

end
