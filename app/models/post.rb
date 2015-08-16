class Post < ActiveRecord::Base
  has_and_belongs_to_many :polyclinics
  has_many :schedules
  
  validates :name, presence: true
end
