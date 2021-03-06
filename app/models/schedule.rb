class Schedule < ActiveRecord::Base
  belongs_to :polyclinic
  belongs_to :post
  belongs_to :doctor
  has_many :routines
  
  validates :time_begin, presence: true
  validates :time_end, presence: true
end
