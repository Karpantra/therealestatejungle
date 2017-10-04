class Brief < ApplicationRecord
  belongs_to :user
  belongs_to :coworking
  has_and_belongs_to_many :surfaces
  has_many :propositions, dependent: :nullify


  ### TODO validations ####
end
