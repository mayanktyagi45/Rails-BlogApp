class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # validates :category, presence: true
end
