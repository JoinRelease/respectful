class BurialCemeteryPlan < ActiveRecord::Base
  belongs_to :burial_plan, inverse_of: :burial_cemetery_plans

  validates :burial_plan, presence: true
end
