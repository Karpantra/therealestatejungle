class Coworking < ApplicationRecord
  belongs_to :user

  has_attachments :photos, maximum: 6
end
