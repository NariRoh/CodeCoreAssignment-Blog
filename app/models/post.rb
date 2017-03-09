class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  before_save :titleize_title

  validates :title, :body, :category_id, presence: true

  def likes_count
    likes.count
  end

  def liked_by?(user)
    likes.exists? user: user
  end

  def like_for(user)
    likes.find_by user: user
  end


  private

  def titleize_title
    self.title = title.titleize
  end

end
