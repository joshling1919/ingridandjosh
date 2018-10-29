class Guest < ApplicationRecord
  belongs_to :group
  validates :fullname, uniqueness: true, presence: true
end
