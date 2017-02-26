class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user

  before_save :titleize_title

  validates :title, :body, :category_id, presence: true

  private

  def titleize_title
    self.title = title.titleize
  end
end
