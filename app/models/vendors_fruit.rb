class VendorsFruit < ApplicationRecord
  belongs_to :vendor
  belongs_to :fruit
end
