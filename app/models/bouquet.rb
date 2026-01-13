class Bouquet < ApplicationRecord
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validate :acceptable_photo

  private

  def acceptable_photo
    return unless photo.attached?

    unless photo.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:photo, "должна быть JPG, PNG или WEBP")
    end

    if photo.byte_size > 5.megabytes
      errors.add(:photo, "размер должен быть меньше 5MB")
    end
  end
end
