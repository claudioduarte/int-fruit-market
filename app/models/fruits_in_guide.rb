class FruitsInGuide < ApplicationRecord
  validates :transportation_guide_id, presence: true
  validates :fruit_id, presence: true
  validates :quantity_id, presence: true

  belongs_to :transportation_guide
  belongs_to :fruit
end
