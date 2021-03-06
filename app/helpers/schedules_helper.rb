module SchedulesHelper
  def select_polyclinic(name, selected = nil)
    select_tag(name, options_for_select(Polyclinic.order('name').load.map{ |x| [x.name, x.id] } + [['', nil]],[selected]))
  end
  
  def select_post(name, selected = nil)
    select_tag(name, options_for_select(Post.order('name').load.map{ |x| [x.name, x.id] } + [['', nil]],[selected]))
  end
  
  def select_doctor(name, selected = nil)
    select_tag(name, options_for_select(Doctor.order('last_name','first_name','second_name').load.map{ |x| [x.last_name+' '+x.first_name+' '+x.second_name, x.id] } + [['', nil]]))
  end
end
