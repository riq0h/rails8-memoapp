class Memo < ApplicationRecord
  validates :content, presence: true

  def self.search(query)
    if query.present?
      where('content LIKE ?', "%#{query}%").order(created_at: :desc)
    else
      order(created_at: :desc)
    end
  end
end
