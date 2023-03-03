class Post < ApplicationRecord
    validates :title, presence: true, length:{ maximum:30 }
   validates :start_at, presence: true
   validates :end_at, presence: true
   validates :description, length: { maximum: 500 }
    validate :start_end_check

    def start_end_check
        if start_at.present? && end_at.present? && start_at >= end_at
            errors.add(:end_at,"は開始日より後の日付を入力してください")
        end
    end

end
