class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.order(published_at: :desc)
  end

  def show
    @article = Article.find_by slug: params[:id]
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find_by slug: params[:id]
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find_by slug: params[:id]

    if @article.update(article_params)
      redirect_to admin_article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find_by slug: params[:id]
    @article.destroy

    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :published_at)
    end
end
