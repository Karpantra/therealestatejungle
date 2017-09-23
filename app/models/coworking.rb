class Coworking < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :surface, presence: true
  validates :workstation_number, presence: true
  validates :special_offer, presence: true
  validates :photos, presence: true

  has_attachments :photos, maximum: 6
end
