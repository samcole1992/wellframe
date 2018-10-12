class Medication < ApplicationRecord

  has_and_belongs_to_many :patients, optional: true

  validates :name, presence: true, uniqueness: true

end
