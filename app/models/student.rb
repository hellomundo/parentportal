class Student < ApplicationRecord
  has_many :users, through: :relationships
  belongs_to :family
end
