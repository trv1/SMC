class Polyclinic < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :schedules
  has_many :doctors
  has_many :routines
  has_many :requests

  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :district, presence: true
  validates :locality, presence: true
end
