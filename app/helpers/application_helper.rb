module ApplicationHelper
  def markdown(content)
    puts content
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      underline: true,
      highlight: true,
      footnotes: true,
      tables: true
    })
    @markdown.render(content)
  end

  def full_name(user)
    return "#{user.first_name} #{user.last_name}"
  end
end
