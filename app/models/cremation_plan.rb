class CremationPlan < ActiveRecord::Base
  belongs_to :passing, inverse_of: :cremation_plans
  has_many :plan_dates, as: :dateable, dependent: :delete_all

  has_one :service_space_address, as: :addressable, class_name: :Address, dependent: :destroy
  has_one :ash_storage_address, as: :addressable, class_name: :Address, dependent: :destroy
  has_one :ash_delivery_address, as: :addressable, class_name: :Address, dependent: :destroy

  validates_presence_of :passing

  accepts_nested_attributes_for :plan_dates, :service_space_address, :ash_storage_address, :ash_delivery_address
end
