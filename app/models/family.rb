class Family < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :students

  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }

  def self.hours_summary_since(time)
    left_joins(:tasks).where("performed_on >= ?", time).group(:name, :id).select(:name).order("sum_tasks_hours").sum("tasks.hours")
    # where("performed_on >= ?", time)
  end

  def self.hours_summary_since3(time)
    joins(:tasks)
      .where("performed_on >= ?", time)
      .select(:name, :id, 'SUM(tasks.hours) AS total_hours')
      .group(:name, :id)
  end

  def self.hours_summary_since2(time)
    left_joins(:tasks).group(:name, :id).select(:name).order("sum_tasks_hours").sum("tasks.hours")
  end
end
