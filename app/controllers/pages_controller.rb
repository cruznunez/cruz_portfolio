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
      red1: '#800013',
      red2: '#A80017',
      red3: '#CF161B',
      red4: '#E01A10',
      red5: '#ED3B39',
      salmon: '#F7484E',
      dark_salmon: '#E81732',
      red_purple: '#913352',
      bright_red_purple: '#CC0040',
      brown: '#C38353',
      orange1: '#E19863',
      orange2: '#FDC581',
      orange3: '#FF924D', #yeezy
      orange4: '#FFA349',
      orange5: '#FF932C',
      orange6: '#FE6D41',
      green1: '#A0E051',
      green2: '#27AE60',
      green3: '#017534',
      green4: '#57FAD1',
      blue1: '#01CFFF',
      blue2: '#71BEEA',
      blue10: '#ABCDEF',
      blue4: '#4285F4',
      blue5: '#0063CD',
      blue6: '#0130B4',
      blue7: '#014685',
      blue8: '#04366B',
      someblue: '#506A8D',
      gray1: '#849FB1',
      gray2: '#ADB6CA',
      pink1: '#FFAABB',
      pink2: '#FE92BB',
      pink3: '#FABDAD',
      purple1: '#DDAADD',
      purple2: '#AA69FF',
      purple3: '#806BB3',
      purple4: '#9B59B6',
      purple5: '#2A206B',
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
