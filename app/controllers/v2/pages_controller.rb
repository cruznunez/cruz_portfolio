class V2::PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :update_color
  before_action :authenticate_user, only: [:colors, :update_color, :site_color]

  def home
    @page = 'Home'
    @projects = Project.all.order(order: :desc).page(params[:page])#.per(3)
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
      r1: '#913352',
      r2: '#800013',
      r3: '#A80017',
      r4: '#CC0040',
      r5: '#CF161B',
      r6: '#E01A10',
      r7: '#E81732',
      r8: '#ED3B39',
      r9: '#F7484E',

      o1: '#FE6D41',
      o2: '#FF924D', # Kanye West TLOP
      o3: '#FF932C',
      o4: '#FFA349',
      o5: '#FDC581',

      y1: '#FFDD27',

      g1: '#A0E051',
      g2: '#27AE60',
      g3: '#017534',
      g4: '#008000', # rgb(0,128,0), green

      gb1: '#57FAD1',
      gb2: '#00DCDC', # rgb(0,220,220)
      gb3: '#00EBEB', # rgb(0,235,235)

      b1: '#01CFFF',
      b2: '#71BEEA',
      b3: '#ABCDEF',
      b4: '#4285F4',
      b5: '#0080FF', # rgb(0,128,255)
      b6: '#0063CD',
      b7: '#0130B4',
      b8: '#014685',
      b9: '#04366B',

      p1: '#2A206B',
      i1: '#4B0082', # indigo
      p2: '#AA69FF',
      p3: '#806BB3',
      p4: '#9B59B6',

      i2: '#DDAADD',

      pink3: '#FABDAD',
      v1: '#FFAABB',
      v2: '#FE92BB',
      v3: '#EE82EE', # violet
      v4: '#FF82EE', # red + violet

      # white: 'white',
      # brown: '#C38353',
      # orange1: '#E19863',
      #
      # someblue: '#506A8D',
      # gray1: '#849FB1',
      # gray2: '#ADB6CA',
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
