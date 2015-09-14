class Religion < ActiveRecord::Base
  validates :name, presence: true
end
