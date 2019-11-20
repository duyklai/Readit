module PostsHelper
  def time_diff(end_time)
    seconds_diff = (Time.now - end_time).to_i.abs
    
    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600
    
    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60
    
    seconds = seconds_diff
    
    if hours == 0 && minutes != 0
      # Checking plural forms
      if minutes == 1
        return "#{minutes.to_s} minute"
      else
        return "#{minutes.to_s} minutes"
      end
    elsif hours > 0 && hours < 24
      if hours == 1
        return "#{hours.to_s} hour"
      else
        return "#{hours.to_s} hours"
      end
    elsif hours >= 24
      hours = hours / 24
      if hours == 1
        return "#{hours.to_s} day"
      else
        return "#{hours.to_s} days"
      end
    end

    #"#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
    # or, as hagello suggested in the comments:
    # '%02d:%02d:%02d' % [hours, minutes, seconds]
  end
end
