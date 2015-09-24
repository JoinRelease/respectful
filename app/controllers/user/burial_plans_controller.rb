class User::BurialPlansController < User::BaseController
  include Wicked::Wizard
  steps :plan_dates, :public_service, :open_casket,  :private_viewing, :type_of_service, :religion_culture_type, :type_of_service_space, :worship_space_in_mind, :location_of_worship_space, :worship_plan_later, :address_of_service_space, :burial_site_in_mind, :burial_types_of_plans, :location_of_burial_site, :burial_space_owned
  before_action :load_user_and_passing

  def show
    case step
    when :plan_dates
      @burial.plan_dates.build
    when :address_of_service_space
      @burial.build_service_space_address
    when :location_of_burial_site
      @burial.build_burial_space_address
    end
    render_wizard
  end

  def update
    @burial.update_attributes(burial_params)
    render_wizard @burial
  end

  private

  def load_user_and_passing
    @user = current_user
    @passing = @user.passings.last
    @burial = @passing.burial_plans.last
  end

  def burial_params
    params.require(:burial_plan).permit!
  end
end
