class Task < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :family, required: true
  belongs_to :task_type, required: true

  validates :hours, presence: true
  validates :hours, numericality: true

end
