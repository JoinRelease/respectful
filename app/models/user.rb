class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :passings, dependent: :delete_all, inverse_of: :user
  has_many :burial_plans, through: :passings
  has_many :cremation_plans, through: :passings
  has_many :burial_mausoleum_plans, through: :burial_plans
  has_many :burial_cemetery_plans, through: :burial_plans
  has_one :lead, dependent: :destroy
  has_one :passing_address, through: :passing


  accepts_nested_attributes_for :passings, :burial_plans, :cremation_plans, :burial_cemetery_plans, :burial_mausoleum_plans, reject_if: :all_blank, allow_destroy: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
