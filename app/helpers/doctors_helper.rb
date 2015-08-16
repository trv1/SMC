module DoctorsHelper
  def select_polyclinic(name, selected = nil)
    select_tag(name, options_for_select(Polyclinic.order('name').load.map{ |x| [x.name, x.id] } + [['', nil]],[selected]))
  end
end
