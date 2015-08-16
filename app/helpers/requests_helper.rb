module RequestsHelper
  def select_polyclinic(name, selected = nil)
    select_tag(name, options_for_select(Polyclinic.order('name').load.map{ |x| [x.name, x.id] } + [['', nil]],[selected]))
  end
  
  def select_post(name, selected = nil)
    select_tag(name, options_for_select(Post.order('name').load.map{ |x| [x.name, x.id] } + [['', nil]],[selected]))
  end
  
  def select_doctor(name, selected = nil)
    select_tag(name, options_for_select(Doctor.order('last_name','first_name','second_name').load.map{ |x| [x.last_name+' '+x.first_name+' '+x.second_name, x.id] } + [['', nil]]))
  end

  def select_schedule(name, selected = nil)
    select_tag(name, options_for_select(Schedule.order('doctor_id').load.map{ |x| [x.doctor_id, x.id] } + [['', nil]],[selected]))
  end

  def select_schedule_day(name, selected = nil)
    select_tag(name, options_for_select(Schedule.order('id').load.map{ |x| [x.scheduleday.strftime("%d/%m/%y"), x.id] } + [['', nil]],[selected]))
  end

  def select_routine(name, selected = nil)
    select_tag(name, options_for_select(Routine.order('timing').load.map{ |x| [x.timing.to_formatted_s(:time), x.id] } + [['', nil]],[selected]))
  end
end
