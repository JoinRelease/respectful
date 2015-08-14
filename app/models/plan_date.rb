class PlanDate < ActiveRecord::Base
  belongs_to :dateable, polymorphic: true
  validates_presence_of :date
  validates_presence_of :dateable
end
