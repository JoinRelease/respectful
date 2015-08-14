class PlanDate < ActiveRecord::Base
  belongs_to :cremation_plan, inverse_of: :plan_dates
  belongs_to :burrial_plan, inverse_of: :plan_dates
end
