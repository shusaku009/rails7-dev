class UsersController < ApplicationController
  def index
    @num = 10 + 20
    @users = User.all
  end
end
