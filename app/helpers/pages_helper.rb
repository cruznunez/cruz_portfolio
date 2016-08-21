module PagesHelper
  def v
    request.path[/\/v\d+\/?/][/v\d+/]
  end
end
