module ApplicationHelper
  def destroy_link(text, href, options = {})
    link_to text, href, options.update(:method => :delete, :confirm => t('are_you_sure'))
  end

  def fa(name)
    content_tag :span, nil, :class => "fa fa-#{name}"
  end

  def flash_alerts
    flash.reduce('') do |n, f|
      n.concat alert(*f)
    end.html_safe
  end

  def alert(type, body)
    render '/shared/alert', :type => type, :body => body
  end
end
