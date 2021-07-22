class Vendor < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true
  has_many :vendors_fruits, dependent: :destroy
end
