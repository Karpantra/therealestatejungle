class Surface < ApplicationRecord
  has_and_belongs_to_many :demands, dependent: :destroy
  has_and_belongs_to_many :briefs, dependent: :destroy
end
