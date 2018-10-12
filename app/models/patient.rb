class Patient < ApplicationRecord

  has_and_belongs_to_many :medications, optional: true

  # Maybe some patients have the same name?
  # validates :name, presence: true, uniqueness: true
  
end
