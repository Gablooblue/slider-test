module ApplicationHelper
  def friendly_datetime(d)
    if d.present?
    d.in_time_zone('Asia/Hong_Kong').strftime("%b %d, %Y %H:%M:%S")
    else
      nil
    end
  end
end
