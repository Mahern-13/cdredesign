module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def email_alert
    flash[:notice] = 'You will receive an email soon!'
  end

end
