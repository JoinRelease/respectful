class Passing < ActiveRecord::Base
  belongs_to :user, inverse_of: :passings
  validates_presence_of :user
end
