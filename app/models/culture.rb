class Culture < ActiveRecord::Base
  validates :name, presence: true
end
