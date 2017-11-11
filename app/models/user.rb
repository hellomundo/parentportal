require 'csv'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  belongs_to :family
  has_many :relationships
  has_many :students, through: :relationsips
  has_one :invitation

  def password_required?
     new_record? ? false : super
  end

  def total_hours
    self.tasks.sum(:hours)
  end

  def total_family_hours
    Task.where(family_id: self.family_id).sum(:hours)
  end

  def full_name
    name = ""
    name.concat(first_name) if !first_name.nil?
    if !last_name.nil?
      name.concat(" ")
      name.concat(last_name)
    end
    name
  end

  def activate!
    self.update(is_active: true)
  end

  def deactivate!
    self.update(is_active: false)
  end

  def self.to_csv
    attributes = %w{first_name last_name phone email}
    CSV.generate do |csv|
      csv << attributes
      all.each do |item|
        csv << item.attributes.values_at(*attributes)
      end
    end
  end

end
