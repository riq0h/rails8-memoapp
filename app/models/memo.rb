class Memo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :content, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[content created_at id updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
