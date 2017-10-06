class Proposition < ApplicationRecord
  belongs_to :brief

  INDEXATION = ["ICC", "ILAT", "ILC"]

  ### TODO validations ####
end
