class Contact < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :user
  validates :owner, uniqueness: { scope: :user,
    message: "This contact already exist" }
end
