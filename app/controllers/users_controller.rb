class UsersController < ApplicationController
  def account
  end

  def profile
    @user = current_user
  end
end
