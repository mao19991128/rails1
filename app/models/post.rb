class Post < ApplicationRecord
    validates :title, presence: true, length:{ maximum:30 }
   validates :start_at, presence: true
   validates :end_at, presence: true
   validates :description, length: { maximum: 500 }
   validate :start_end_check

   def start_end_check
        errors.add(:end_at,"は開始日以降の日付を選択してください") if self.start_at > self.end_at
   end

end
