class UsersController < ApplicationController
  before_action :if_not_admin, only: [:index]

  def index
    @users = User.where(delete_at: nil)
  end

  def show
    @user = current_user
  end
end

private

def if_not_admin
  redirect_to root_path unless current_user.admin?
end
