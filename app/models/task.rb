class Task < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :family, required: true
  belongs_to :task_type, required: true

  validates :hours, presence: true
  validates :performed_on, presence: true
  validates :hours, numericality: true

  def self.performed_after(time)
    where("performed_on >= ?", time)
  end

  def self.total_hours_for_family_since(family_id, start_date)
    performed_after(start_date).where(family_id: family_id).sum(:hours)
  end

  def self.tasks_for_user_since(user_id, start_date)
    performed_after(start_date).includes(:user, :task_type).where(user_id: user_id).order("created_at DESC")
  end

  def self.tasks_for_family_since(family_id, start_date)
    performed_after(start_date).includes(:user, :task_type).where(family_id: family_id).order("created_at DESC")
  end

  def self.total_hours_for_all_families_since(start_date)
    performed_after(start_date).where('is_active=true').joins(:family).group("families.name", "families.id").select("families.name", "families.id").order("sum_tasks_hours").sum("tasks.hours")
  end

  def self.total_hours_since(start_date)
    performed_after(start_date).sum(:hours)
  end
end
