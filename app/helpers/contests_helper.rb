module ContestsHelper

  def relative_time(start_time)
    diff_seconds = Time.now - start_time
    case diff_seconds
    when 0 .. 59
      return "#{diff_seconds.to_i} seconds ago"
    when 60 .. (3600-1)
      return "#{(diff_seconds/60).to_i} minutes ago"
    when 3600 .. (3600*24-1)
      return "#{(diff_seconds/3600).to_i} hours ago"
    when (3600*24) .. (3600*24*30)
      return "#{(diff_seconds/(3600*24)).to_i} days ago"
    when -59..-1
      return "#{diff_seconds.to_i.abs} seconds later"
    when -(3600-1) .. -60
      return "#{(diff_seconds/60).to_i.abs} minutes later"
    when -(3600*24-1) .. -3600
      return "#{(diff_seconds/3600).to_i.abs} hours later"
    when -(3600*24*30) .. -(3600*24)
      return "#{(diff_seconds/(3600*24)).to_i.abs} days later"
    else
      return start_time
    end
  end
end
