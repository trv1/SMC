class Routine < ActiveRecord::Base
  belongs_to :polyclinic
  belongs_to :post
  belongs_to :schedule
  has_one :request
end
