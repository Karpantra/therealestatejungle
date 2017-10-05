class Contract < ApplicationRecord
  has_and_belongs_to_many :coworkings, dependent: :destroy
  has_and_belongs_to_many :briefs
end
