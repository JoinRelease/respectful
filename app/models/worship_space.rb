class WorshipSpace < ActiveRecord::Base
  validates :name, presence: true
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end
