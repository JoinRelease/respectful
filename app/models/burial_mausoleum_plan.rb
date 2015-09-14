class BurialMausoleumPlan < ActiveRecord::Base
  belongs_to :burial_plan, inverse_of: :burial_mausoleum_plans

  validates :burial_plan, presence: true
end
