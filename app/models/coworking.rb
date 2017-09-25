class Coworking < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :contracts
  has_and_belongs_to_many :landlords
  has_and_belongs_to_many :types

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  # validates :title, presence: true
  # validates :name, presence: true
  # validates :address, presence: true
  # validates :surface, presence: true
  # validates :workstation_number, presence: true
  # validates :photos, presence: true

  has_attachments :photos, maximum: 6
end
