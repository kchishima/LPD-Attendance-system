class Member < ApplicationRecord
  has_many :attendance_informations,dependent: :destroy
  has_many :work_scheduleds,dependent: :destroy
  attachment :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  def applying?
    attendance_informations.any?{|attendance_information|attendance_information.applying?}
  end
end
