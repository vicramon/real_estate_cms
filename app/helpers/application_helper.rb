module ApplicationHelper

  def block_class(block)
    if block.image_url.present?
      "image_#{block.image_align}"
    else
      "no_image"
    end
  end

  def li_present(object, attribute)
    return nil unless object.send(attribute).present?
    content_tag('li') do
      "#{attribute.capitalize}: #{object.send(attribute)}"
    end
  end

  def li_link_to(text, path, link_options={})
    if link_options[:exclude]
      active = request.path.exclude?(link_options.delete(:exclude).to_s)
    else
      active = request.path.include?(path.to_s)
    end
    active = true if path == "/home" && request.path == "/"
    active_class = active ? 'active' : nil
    content_tag('li', class: [active_class, link_options.delete(:li_class)].compact) do
      link_to text, path, link_options
    end
  end

  def link_to_if_present(path, link_options={}, &block)
    link_to path, link_options, &block if path.present?
  end

end
