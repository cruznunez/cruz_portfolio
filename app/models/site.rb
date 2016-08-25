class Site < ActiveRecord::Base
  def self.colors
    {
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

  def self.colors_2 # http://codepen.io/DeptofJeffAyer/post/more-gooder-sass-color-variables
    {
      red58: '#ED3B39',
      red47: '#E01A10',
      red83: '#FABDAD',
      red63: '#FE6D41',
      orange65: '#FF924D',
      orange64: '#E19863',
      orange55: '#C38353',
      orange59: '#FF932C',
      orange64: '#FFA349',
      orange75: '#FDC581',
      yellow58: '#FFDD27',
      green60: '#A0E051',
      green25: '#008000',
      green42: '#27AE60',
      green23: '#017534',
      cyan66: '#57FAD1',
      cyan46: '#00EBEB',
      cyan43: '#00DCDC',
      cyan50: '#01CFFF',
      blue68: '#71BEEA',
      blue61: '#849FB1',
      blue26: '#014685',
      blue80: '#ABCDEF',
      blue50: '#0080FF',
      blue22: '#04366B',
      blue40: '#0063CD',
      blue43: '#506A8D',
      blue61: '#4285F4',
      blue74: '#ADB6CA',
      blue35: '#0130B4',
      blue27: '#2A206B',
      purple56: '#806BB3',
      purple71: '#AA69FF',
      purple25: '#4B0082',
      purple53: '#9B59B6',
      pink77: '#DDAADD',
      pink72: '#EE82EE',
      pink75: '#FF82EE',
      red78: '#FE92BB',
      red38: '#913352',
      red40: '#CC0040',
      red83: '#FFAABB',
      red25: '#800013',
      red50: '#E81732',
      red33: '#A80017',
      red63: '#F7484E',
      red45: '#CF161B',
    }
  end

  def self.colors_3
    {
      red25: '#800013',
      red33: '#A80017',
      red38: '#913352',
      red40: '#CC0040',
      red45: '#CF161B',
      red47: '#E01A10',
      red50: '#E81732',
      red58: '#ED3B39',
      red63: '#FE6D41', # dup
      red635: '#F7484E', # dup
      red78: '#FE92BB',
      red83: '#FABDAD', # dup
      red835: '#FFAABB', # dup
      orange55: '#C38353',
      orange59: '#FF932C',
      orange64: '#E19863', # dup
      orange645: '#FFA349', # dup
      orange65: '#FF924D',
      orange75: '#FDC581',
      yellow58: '#FFDD27',
      green23: '#017534',
      green25: '#008000',
      green42: '#27AE60',
      green60: '#A0E051',
      cyan43: '#00DCDC',
      cyan46: '#00EBEB',
      cyan50: '#01CFFF',
      cyan66: '#57FAD1',
      blue22: '#04366B',
      blue26: '#014685',
      blue27: '#2A206B',
      blue35: '#0130B4',
      blue40: '#0063CD',
      blue43: '#506A8D',
      blue50: '#0080FF',
      blue61: '#4285F4', # dup
      blue61: '#849FB1', # dup
      blue68: '#71BEEA',
      blue74: '#ADB6CA',
      blue80: '#ABCDEF',
      purple25: '#4B0082',
      purple53: '#9B59B6',
      purple56: '#806BB3',
      purple71: '#AA69FF',
      pink72: '#EE82EE',
      pink75: '#FF82EE',
      pink77: '#DDAADD',
    }
  end
end
