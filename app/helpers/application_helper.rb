require 'rdiscount'

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

  def alert(type, message = nil, &body)
    render '/shared/alert', :type => type, :message => message, :body => body
  end

  def next_path_field
    hidden_field_tag :next, next_path
  end

  def markdown_to_html(source)
    RDiscount.new(source, :autolink, :filter_html).to_html.html_safe
  end
  
  def humanize_and_pluralize(number, word)
    number_to_human(number).concat " #{word}".pluralize(number)
  end
end
