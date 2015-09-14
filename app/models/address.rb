class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates :addressable, :line1, :city, :state, :zip, presence: true
end
