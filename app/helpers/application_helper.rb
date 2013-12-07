module ApplicationHelper
  def destroy_link(text, href, options = {})
    link_to text, href, options.update(:method => :delete, :confirm => t('are_you_sure'))
  end

  def fa(name)
    content_tag :span, nil, :class => "fa fa-#{name}"
  end
end
