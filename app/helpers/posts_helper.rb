module PostsHelper
  def time_diff(end_time)
    # Code modified from https://stackoverflow.com/questions/19595840/rails-get-the-time-difference-in-hours-minutes-and-seconds/19596579
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
      days = hours / 24
      if days == 1
        return "#{hours.to_s} day"
      else
        return "#{hours.to_s} days"
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
