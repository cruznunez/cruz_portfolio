module ApplicationHelper
  def back
    link = click_area(:back)
    "<span class='big-button submit'>#{link}Back</span>".html_safe
  end

  def click_area(path)
    link_to '<span class="click-area"></span>'.html_safe, path
  end

  def description(string = nil)
    set_meta_tags description: string if string
    prepare_meta_tags
    super
  end

  def destroy(resource)
    thing = resource.class.to_s.downcase
    path = "/#{thing}s/#{resource.id}"
    button_to "Delete", path, method: :delete, class: "big-button red-button", data: {confirm: "Are you sure you want to delete this #{thing}?"}
  end

  def link tech
    content = if tech.long_name.present?
      "<span class='desktop-only'>#{tech.long_name}</span><span class='mobile-only'>#{tech.name}</span>"
    else
      tech.name
    end
    "<li><a href='#{tech.link}' class='pop' target='_blank'>#{content}</a></li>".html_safe
  end

  def logged_in?
    session[:user_id]
  end

  def navigation(page)
    href, icon = hrefs(page), icons(page)
    click_area = click_area(href)
    css_class = @page == page ? 'button selected' : 'button'
    extra = page == 'Colors' ? 'color-button' : nil
    "<span class='#{css_class} #{extra}'>#{click_area}#{icon}#{page}</span>".html_safe
  end

  def icons page
    if page == 'Colors'
      "<img class='mobile-only' style='height:17px;' src='#{asset_url('colors.png')}'><br class='mobile-only'>"
    else
      icon_class = {
        'Home' => 'fa fa-home',
        'Projects' => 'fa fa-file-code-o',
        'Resumé' => 'fa fa-check-square-o'
      }[page]
      "<i class='#{icon_class}'></i>"
    end
  end

  def hrefs page
    {
      'Home' => '/',
      'Projects' => '/projects',
      'Resumé' => '/resume',
      'Colors' => '/colors'
    }[page]
  end

  def site_color(color = nil)
    color ||= Site.first.color rescue 'blue'
    %Q(
      <style>
        .page-header {
          background: #{color};
        }
        .main-content p a, .main-content h3, .main-content h2, .main-content p a:hover {
          color: #{color};
        }
        .main-content p a:hover {
          border-color: #{color};
        }
        .project-title:hover {
          border-color: #{color}
        }
        .tumblr-input:focus {
          border-color: #{color};
        }
        @media (min-width: 769px) {
          .button,
          .big-button {
            background: #{color};
            border-color: #{color};
          }
          .button:hover, .big-button:hover {
            color: #{color};
          }
        }
        @media only screen and (min-width: 1px) and (max-width: 768px) {
          .selected {
            color: #{color};
          }
        }
      </style>
    ).html_safe
  end

  def title(title = nil, output = nil)
    set_meta_tags(title: title) if title
    prepare_meta_tags
    super
  end
end
