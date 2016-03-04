class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def register
  	user = User.create(name: params[:name], alias: params[:alias], email: params[:email], password:params[:password])
  	session[:user_id] = user.id
  	redirect_to "/posts/index"
  end

  def login
  	if User.find_by(email: params[:email]) and User.find_by(password: params[:password])!= nil
  		user = User.find_by(email: params[:email])
  		session[:user_id] = user.id
  		redirect_to "/posts/index"
  	end
  end

  def logout
  	session.clear
  	redirect_to '/'
  end


end
