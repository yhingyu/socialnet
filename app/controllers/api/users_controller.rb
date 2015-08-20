module API
  class UsersController < ApplicationController
    def index
      users = User.all
      if email = params[:email]
        users = User.where(email: email)
      end
      render json: users, status: 200
    end

    def show
      user = User.find(params[:id])
      render json: user, status: 200
    end

    def create
      #user = User.new

    end
  end
end