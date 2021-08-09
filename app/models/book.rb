class Book < ApplicationRecord
  belongs_to :user
  attachment :image # ここを追加（_idは含めません）
  
  validates :title, presence: true
  validates :body, presence: true
end
