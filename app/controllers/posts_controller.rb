class PostsController < ApplicationController
  def by_blog
    @posts = Post.find_by_blog(params[:blog])
    @list_name = params[:blog]
    render :index
  end
  
  def by_category
    @posts = Post.where(params[:category] => true)
    @list_name = Post.category_labels[params[:category].to_sym]
    render :index
  end
end
