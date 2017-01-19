class Task < ApplicationRecord
  belongs_to :user
  belongs_to :family
  belongs_to :task_type

  validates :hours, presence: true
  validates :hours, numericality: true

end
