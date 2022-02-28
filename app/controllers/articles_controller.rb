class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only: [:index, :new, :create]
  before_action :find_article, only: [:show, :edit, :update, :destroy, :state]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = @blog.articles.build(articles_params)
    if @article.save
      redirect_to blog_articles_path, notice: "新增文章成功"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(articles_params)
      redirect_to blog_articles_path(@article.blog), notice: "修改Blog成功"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to blog_articles_path(@article.blog), notice: "刪除Blog成功"
  end

  def state
    if @article.state
      @article.update(state: false)
    else
      @article.update(state: true)
    end
    redirect_to blog_articles_path(@article.blog), notice: "修改成功" 
  end

  private
  def articles_params
    params.require(:article).permit(:title, :content, :state)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def find_blog
    @blog = Blog.find(params[:blog_id])
  end
end