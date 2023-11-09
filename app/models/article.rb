# Article class
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 10 }
  validates :description, presence: true, length: { minimum: 3, maximum: 3 }
end
