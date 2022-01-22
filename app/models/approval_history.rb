class ApprovalHistory < ApplicationRecord
  belongs_to :admin
  belongs_to :attendance_information
end
