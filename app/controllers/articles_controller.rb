class ArticlesController < ApplicationController
  def index
  @articles = Article.all
  # GET /articles
  end

  def show
  @articles = Article.find(params[:id])          # GET /articles/:id
  end

  def new
  @article = Article.new           # GET /articles/new
  end

  def create
  @article = Article.new(article_params)
  @article.save        # POST /articles
  redirect_to articles_path(@article)
  end

  def edit
  @article = Article.find(params[:id])          # GET /articles/:id/edit
  end

  def update
  @article = Article.find(params[:id])
  @article.update(article_params)
          # PATCH /articles/:id
  redirect_to articles_path(@article)
  end

  def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to articles_path(@article)     # DELETE /articles/:id
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
