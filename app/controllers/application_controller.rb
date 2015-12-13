class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"
  helper_method :prepare_meta_tags

  include ApplicationHelper

  def prepare_meta_tags(options={})
    site        = CONFIG['site']
    title       = options[:title] || meta_tags[:title] || CONFIG['title']
    description = options[:description] || meta_tags[:description] || CONFIG['description']
    image       = options[:image] || meta_tags[:image] || CONFIG['image']
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:         site,
      title:        title,
      image:        image,
      description:  description,
      keywords:     CONFIG['keywords'].split,
      twitter: {    title: title,
                    site_name: site,
                    site: '@' + CONFIG['twitter'],
                    card: 'summary',
                    description: description,
                    image: image },
      og: {         url: current_url,
                    site_name: site,
                    title: title,
                    image: image,
                    description: description,
                    type: 'website'}
    }
    options.reverse_merge!(defaults)
    set_meta_tags options
  end

  def authenticate_user
    unless logged_in?
      redirect_to projects_path
    end
  end
end
