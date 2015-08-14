class WorshipSpace < ActiveRecord::Base
  validates_presence_of :name
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end
