class Food < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :name, presence: true

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  def self.left_join_liked_foods(user_id)
    join_sql = <<~SQL.squish
      LEFT OUTER JOIN likes ON likes.food_id = foods.id
                            AND likes.user_id = #{user_id}
    SQL
    joins(join_sql)
  end

  mount_uploader :image, ImageUploader
end
