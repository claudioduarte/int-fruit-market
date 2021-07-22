class TransportationGuide < ApplicationRecord
  validates :country_origin, presence: true
  validates :country_destination, presence: true
  validates :hour_departure, presence: true
  validates :hour_arrival, presence: true
  validates :timezone, presence: true

  has_many :fruits_in_guides, dependent: :destroy
end
