class Micropost < ApplicationRecord
  belongs_to :user

  scope :time_desc, ->{order created_at: :desc}

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.model.microposts.size_post}
  validate :picture_size

  private

  def picture_size
    if picture.size > Settings.model.microposts.size_bit.megabytes
      errors.add :picture, t(".should_be_5MB")
    end
  end
end
