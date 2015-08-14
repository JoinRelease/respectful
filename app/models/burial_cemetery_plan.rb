class BurialCemeteryPlan < ActiveRecord::Base
  belongs_to :burial_plan, inverse_of: :burial_cemetery_plans

  validates_presence_of :burial_plan
end
