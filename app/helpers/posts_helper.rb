module PostsHelper
  def time_diff(end_time)
    # Code modified from https://stackoverflow.com/questions/19595840/rails-get-the-time-difference-in-hours-minutes-and-seconds/19596579
    seconds_diff = (Time.now - end_time).to_i.abs

    puts end_time
    puts Time.now.day
    puts seconds_diff
    
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
    elsif hours >= 24 && hours < 720
      days = hours / 24
      if days == 1
        return "#{days.to_s} day"
      else
        return "#{days.to_s} days"
      end
    elsif hours >= 720 && hours < 262800
      months = (hours / 24) / 30
      if months == 1
        return "#{months.to_s} month"
      else
        return "#{months.to_s} months"
      end
    elsif hours >= 262800
      years = ((hours / 24) / 30) / 12
      if years == 1
        return "#{years.to_s} year"
      else
        return "#{years.to_s} years"
      end
    else
      return "Less than 1 minute"
    end
  end

  def display_points(points)
    if points > 999
      points_reform = points / 1000.0
      return sprintf('%.1fk', points_reform)
    else
      return "#{points}"
    end
  end

  def display_comments(num_comments)
    if num_comments == 1
      return "#{num_comments} comment"
    elsif num_comments > 999
      comments = num_comments / 1000.0
      return sprintf('%.1fk comments', comments)
    else
      return "#{num_comments} comments"
    end
  end

  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render("comments", comment: comment) + content_tag(:div, nested_comments(sub_comments), class: "nested_replies")
    end.join.html_safe
  end
end
