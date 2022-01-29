class WorkScheduled < ApplicationRecord
  belongs_to :member
  # 日付が跨いで登録されたらエラーメッセージ
  validate :work_scheduled_date

  def work_scheduled_date
  if time_in.to_date != time_out.to_date
    errors.add(:base, "日を跨いで入力できません")
  end
  end
end
