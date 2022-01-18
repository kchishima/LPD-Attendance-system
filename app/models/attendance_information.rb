class AttendanceInformation < ApplicationRecord
  belongs_to :member
  has_one :approval_history
  enum status: { applying: 0, approval: 1, nonapproval: 2 }
end
