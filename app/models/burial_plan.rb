class BurialPlan < ActiveRecord::Base
  belongs_to :passing, inverse_of: :burial_plans
  has_many :plan_dates, as: :dateable, dependent: :delete_all
  has_many :burial_cemetery_plans, dependent: :delete_all, inverse_of: :burial_plan
  has_many :burial_mausoleum_plans, dependent: :delete_all, inverse_of: :burial_plan

  has_one :service_space_address, -> { where(type_of: 'service space') }, as: :addressable, class_name: :Address, dependent: :destroy
  has_one :burial_space_address, -> { where(type_of: 'burial space') }, as: :addressable, class_name: :Address, dependent: :destroy

  validates :passing, presence: true

  accepts_nested_attributes_for :plan_dates, :service_space_address, :burial_space_address
end
