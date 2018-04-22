class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
  end

  def show
    flash.now[:notice] = "ようこそ。　本日は#{Date.today}です"
    @users = User.all
  end
end
