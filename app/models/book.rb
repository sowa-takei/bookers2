class Book < ApplicationRecord
  belongs_to :user
  #attachment :image # ここを追加（_idは含めません）

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {maximum: 200}
end
