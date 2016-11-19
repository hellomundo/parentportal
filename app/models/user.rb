class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  belongs_to :family
  has_many :relationships
  has_many :students, through: :relationsips

  def total_hours
    self.tasks.sum(:hours)
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
end
