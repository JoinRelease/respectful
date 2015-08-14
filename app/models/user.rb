class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :passings, dependent: :delete_all, inverse_of: :user


  accepts_nested_attributes_for :passings, reject_if: :all_blank, allow_destroy: true
end
