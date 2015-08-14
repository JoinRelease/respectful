class User::AfterSignupController < User::BaseController
  include Wicked::Wizard
  steps :basic_info, :passing_name, :passing_relation, :passing_dates, :passing_location, :start_planning
  before_action :load_user_and_passing

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user.update_attributes(user_attributes)
    render_wizard @user
  end

  private

  def load_user_and_passing
    @user = current_user
    if @user.passings.present?
      @passing = @user.passings.last
    else
      @passing = @user.passings.build
    end
  end

  def user_attributes
    params.require(:user).permit!
  end
end
