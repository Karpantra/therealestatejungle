class Occupation < ApplicationRecord
  has_and_belongs_to_many :demands, dependent: :destroy
end
