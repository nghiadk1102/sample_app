class Comment < ApplicationRecord
  has_many :comment2rd, class_name: Comment.name, foreign_key: "comment1st_id",dependent: :destroy
  belongs_to :post
  belongs_to :user
  belongs_to :comment1st, class_name: Comment.name, optional: true

  validates :body, presence: true

  scope :check_2rd, ->{where comment1st_id: nil}
end
