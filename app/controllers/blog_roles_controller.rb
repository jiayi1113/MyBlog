class BlogRolesController < ApplicationController
  before_action :authenticate_user!

  def index
    @blog = Blog.find(params[:blog_id])
    @blog_roles = @blog.blog_roles.all
  end

  def new
    @blog_role = BlogRole.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @user = User.find_by(email: role_params[:email])
    blog_role = BlogRole.find_by(user_id: @user, blog_id: @blog)


    if !blog_role.present?
      BlogRole.create(user: @user,blog: @blog, role: role_params[:role])
      redirect_to blogs_path, notice: "新增管理員成功"
    else
      redirect_to blogs_path, notice: "已存在"
    end
  end

  def destroy
    @blog_role = BlogRole.find(params[:id])
    @blog_role.destroy
    redirect_to blogs_path, notice: "刪除管理員成功"
  end

  private
  def role_params
    params.require(:blog_role).permit(:role, :email)
  end
end