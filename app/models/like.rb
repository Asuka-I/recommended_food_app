class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :food_id
  validates :user_id, uniqueness: {
    scope: :post_id,
    message: "は同じ投稿に2回以上いいねはできません"
  }
end
