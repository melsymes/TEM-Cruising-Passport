class HomeController < ApplicationController
  def index
    if !current_user.nil?
      @user = current_user unless current_user.nil?
      @marina = @user.marina unless @user.marina.nil?
    end
  end
end
