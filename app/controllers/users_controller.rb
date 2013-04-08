class UsersController < ApplicationController
  def index
    @users = User.by_karma.paginate(:page => params[:page]).order('id DESC')
  end
end
