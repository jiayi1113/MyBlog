class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      BlogRole.create(user: current_user, blog: @blog, role: 0)
      redirect_to blogs_path, notice: "新增Blog成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "修改Blog成功"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "刪除Blog成功"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def find_blog
    @blog = Blog.find(params[:id])
  end
end
