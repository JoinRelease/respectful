class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates_presence_of :addressable, :line1, :city, :state, :zip
end
