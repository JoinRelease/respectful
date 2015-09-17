class Lead < ActiveRecord::Base
  after_create :send_email

  validates :name, :phone_number, presence: true

  belongs_to :user

  def send_email
    NewLead.send_notification(self).deliver_later
  end
end
