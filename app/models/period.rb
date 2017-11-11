class Period < ApplicationRecord
  validates :name, presence: true

  # returns the beginning date of the latest period
  def self.current_period_start_date
    latest.from_date
  end

  #returns the most recent period
  def self.latest 
    all.order('from_date DESC').first
  end
end

