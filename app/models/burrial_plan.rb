class BurrialPlan < ActiveRecord::Base
  has_many :plan_dates, dependent: :delete_all, inverse_of: :burrial_plan
end
