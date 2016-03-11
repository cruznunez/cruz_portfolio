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
    @colors = {
      red: '#E01A10',
      old_red: '#CF161B',
      salmon: '#F7484E',
      orange: '#FF924D',
      yellow: '#FBBC05',
      green: '#27AE60',
      light_blue: '#4285F4',
      blue: '#2222CD',
      dark_blue: '#1C3965',
      purple: '#9B59B6',
      dark_purple: '#2A206B',
      red_button: '#E82E1E',
    }
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
