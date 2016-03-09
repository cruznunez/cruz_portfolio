class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :update_color
  before_action :authenticate_user, only: [:colors, :update_color, :site_color]

  def home
    @page = 'Home'
  end

  def projects
    @page = 'Projects'
  end

  def resume
    @page = 'Resumé'
  end

  def colors
    @page = 'Colors'
    Site.create(color: '#2222CD') if Site.count == 0
    @color = Site.first.color
  end

  def update_color
    color = params.permit(:color)
    Site.first.update(color)
    redirect_to :root
  end

  def site_color
    @color = params[:color]
  end
end
