class PostsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@posts = Post.all
  	@likes = Like.where(:user_id => session[:user_id])
  end

  def show
  	@user = User.find(session[:user_id])
  	@post = Post.find_by_id!(params[:id])
  end

  def add_post
  	post = Post.create(user_id: session[:user_id], message: params[:message])
  	redirect_to '/posts/index'
  end

  def delete
  	Post.destroy(params[:id])
  	redirect_to '/posts/index'

  end

  def like
  	@like = Like.create(user_id: session[:user_id], post_id: params[:id])
  	redirect_to "/posts/index"
  end
end
