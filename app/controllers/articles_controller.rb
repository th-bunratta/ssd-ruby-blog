class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def edit
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to action: :index
    else
      render :edit
    end
  end
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to action: :index
  end
  private
  def article_params
    params['article'].permit(:title, :body)
  end
end