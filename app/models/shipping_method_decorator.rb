ShippingMethod.class_eval do
  default_scope :order => 'deadline DESC'

  def cutoff
    t = Time.now
    tmp = t.year.to_s + '-' + t.month.to_s + '-' + t.day.to_s + ' ' + deadline
    Time.parse(tmp)
  end

end
