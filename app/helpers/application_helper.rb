module ApplicationHelper


  def delivery_options(time_to_parse)
    require 'chronic'
    Chronic.time_class = Time.zone
    
    time_to_parse = '2012-08-04 12:00:00' if (Time.zone.now.to_date == Date.parse('2012-08-2') || Time.zone.now.to_date == Date.parse('2012-08-3')) 
    
    @last_pickup   = ShippingMethod.maximum('deadline')
    @last_pickup   += @last_pickup.downcase.include?("pm") ? '' : 'PM'
    @current_time = Chronic.parse(time_to_parse)
    @cutoff_time  = Chronic.parse(@last_pickup,:now => @current_time)
    @delivery_date = case
                      when [6,0].include?(@current_time.wday) || (@current_time.wday == 5 && @current_time > @cutoff_time)
                        then Chronic.parse('monday')
                      when @current_time > @cutoff_time
                        then @current_time + 1.day
                      else @current_time
                    end
    @weekend       = [6,0].include?(@current_time.wday)
    @delivery_today = @delivery_date.wday == @current_time.wday
    @delivery_day  = @delivery_today ? 'Today' : Date::DAYNAMES[@delivery_date.wday]
  end

  def errors_exist?
    [:notice, :error].select {|msg_type| flash.include?(msg_type) }.empty?
  end

end
