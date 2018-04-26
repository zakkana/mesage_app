class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
    @users = User.all
  end

  def show
    flash.now[:notice] = "ようこそ。　本日は#{Date.today}です"
    @users = User.all
  end

  def create
    @user = User.find(params[:username])
    @post = @user.comments.create(params[:poster].permit(:poster))
    redirect_to post_path(@user)
  end
end
