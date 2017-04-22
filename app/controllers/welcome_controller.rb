class WelcomeController < ApplicationController
  layout false, only: [:sitemap]


  def index
  end


  def sitemap
    @articles = Article.all
  end
end
