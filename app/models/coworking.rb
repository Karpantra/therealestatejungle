class Coworking < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  monetize :price_cents

  validates :title, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :surface, presence: true
  validates :workstation_number, presence: true
  validates :photos, presence: true

  has_attachments :photos, maximum: 6
end
