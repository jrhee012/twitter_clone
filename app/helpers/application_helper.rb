module ApplicationHelper
  # Helper function to use Bootstrap for flash messages
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-danger"
    when 'alert' then "alert alert-danger"
    end
  end
end
