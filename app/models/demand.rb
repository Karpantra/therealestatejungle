class Demand < ApplicationRecord
  belongs_to :user

  validates :company_name, presence: true
  validates :budget, presence: true
  validates :location, presence: true
  validates :surface, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :workstation_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :meeting_room_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :parking_number, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :surface_type, presence: true
  validates :move_in_date, presence: true
end


