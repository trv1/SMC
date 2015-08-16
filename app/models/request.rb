class Request < ActiveRecord::Base
  belongs_to :polyclinic
  belongs_to :post
  belongs_to :schedule
  belongs_to :routine
  belongs_to :user
  
  before_create :check_params
  
  def check_params
    if self.polyclinic.blank?
      self.errors[:polyclinic]<<" не существует"
    end
    Polyclinic.all.to_a.each do |x|
      if self.polyclinic.id!=x.id
        self.errors[:polyclinic]<<" не существует"
      end
    end  
    if self.post.blank?
      flash[:danger]="Невозможно создать заявку с несуществующей специальностью"
    end
    if self.schedule.blank?
      flash[:danger]="Невозможно создать заявку с несуществующей датой"
    end
    if self.routine.blank?
      flash[:danger]="Невозможно создать заявку с несуществующем временем приема"
    end
    Request.all.to_a.each do |r|
      if self.polyclinic.id == r.polyclinic.id && self.post.id == r.post.id && self.schedule.id == r.schedule.id && self.routine.id == r.routine.id
        errors.add(:request, " уже существует")
      end
    end
  end
end
