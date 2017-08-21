class ToppagesController < ApplicationController
  before_action :forbid_login_user
  
  def index
    if logged_in?
      @user = current_user
    end
  end
end
