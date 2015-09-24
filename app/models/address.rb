class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates :line1, :city, :state, :zip, presence: true

  def humanize
    "#{line1}, #{line2.present? ? line2 + ' ,' : ''} #{city}, #{state} #{zip}"
  end
end
