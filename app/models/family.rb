class Family < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :students

end
