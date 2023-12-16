class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity #this is for rails 7+
    end
  end

  def edit
  end

  def update
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "article updated"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
