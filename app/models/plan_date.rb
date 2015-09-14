class PlanDate < ActiveRecord::Base
  belongs_to :dateable, polymorphic: true
  validates :date, :dateable, presence: true
end
