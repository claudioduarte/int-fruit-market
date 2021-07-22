class Fruit < ApplicationRecord
  # SEARCH
  include PgSearch::Model
  pg_search_scope :search_fruit, against: %i[name]
  # VALIDATIONS
  validates :name, presence: true
  validates :image_url, presence: true, format: URI::regexp(%w(http https))
  validates :description, presence: true
  # ASSOCIATIONS
  has_many :vendors_fruits, dependent: :destroy
  has_many :fruits_in_guides, dependent: :destroy
end
