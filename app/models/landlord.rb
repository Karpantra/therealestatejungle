class Landlord < ApplicationRecord
  has_and_belongs_to_many :coworkings, dependent: :destroy
end
