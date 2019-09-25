class Family < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :students

  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }


end
