class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy # the dependent destroy means that if you delete a restaurant it deletes all reviews.
  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, presence: true
  validates :address, presence: true
  # validates :phone_number, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
