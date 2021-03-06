class Doctor < ActiveRecord::Base
  belongs_to :polyclinic
  has_many :schedules
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :second_name, presence: true
end
