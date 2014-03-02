module ApplicationHelper

  def errors_to_ul(errors)
    content_tag(:ul,
      errors.messages.map do |k,v|
        content_tag(:li, "#{k.to_s.titleize} #{v.to_sentence}") unless v.empty?
      end.compact.join.html_safe
    )
  end

  def boolean_to_yesno(bln)
    ( bln ? "<strong class=\"yes\">Yes</strong>" : "<em class=\"no\">No</em>" ).html_safe
  end
end
