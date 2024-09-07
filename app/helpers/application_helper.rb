module ApplicationHelper
  def flash_title_for(flash_type)
    case flash_type.to_sym
    when :notice
      'Success!'
    when :alert
      'Warning!'
    when :error
      'Error!'
    else
      'Notice'
    end
  end
end
