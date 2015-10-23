module ApplicationHelper
  def navigation(page)
    href = {"Home" => "/", "Projects" => "projects", "Resumé" => "resume" }[page]
    css_class = @page == page ? "button selected" : "button"
    icon_class = {"Home" => "fa fa-home", "Projects" => "fa fa-file-code-o", "Resumé" => "fa fa-check-square-o" }[page]
    "<a href='#{href}'><span class='#{css_class}'><i class='#{icon_class}'></i>#{page}</span></a>".html_safe
  end
end
