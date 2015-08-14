class Lead < ActiveRecord::Base
  after_create :send_email

  validates :name, presence: true
  validates :phone_number, presence: true

  def send_email
    NewLead.send_notification(self).deliver_later
  end
end
