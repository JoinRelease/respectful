class BurialMausoleumPlan < ActiveRecord::Base
  belongs_to :burial_plan, inverse_of: :burial_mausoleum_plans

  validates_presence_of :burial_plan
end
