module ApplicationHelper

  def li_link_to(text, path, link_options={})
    if link_options[:exclude]
      active = request.path.exclude?(link_options.delete(:exclude).to_s)
    else
      active = request.path.include?(path.to_s)
    end
    active_class = active ? 'active' : nil
    content_tag('li', class: [active_class, link_options.delete(:li_class)].compact) do
      link_to text, path, link_options
    end
  end

end
