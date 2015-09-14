class Passing < ActiveRecord::Base
  belongs_to :user, inverse_of: :passings
  validates :user, presence: true
  has_one :passing_address, as: :addressable, class_name: :Address, dependent: :destroy
  has_many :burial_plans, dependent: :delete_all, inverse_of: :passing
  has_many :burial_cemetery_plans, through: :burial_plans
  has_many :burial_mausoleum_plans, through: :burial_plans
  has_many :cremation_plans, dependent: :delete_all, inverse_of: :passing
end
