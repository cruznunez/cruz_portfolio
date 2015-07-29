class PagesController < ApplicationController
  def home
    @page = "Home"
  end

  def projects
    @page = "Projects"
  end

  def resume
    @page = "Resumé"
  end
end
