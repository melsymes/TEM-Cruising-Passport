class HomeController < ApplicationController
  def index

    if params[:set_locale]
     redirect_to root_path(locale: params[:set_locale])
    end
    if !current_user.nil?
      @user = current_user unless current_user.nil?
      @marina = @user.marina
    end
  end
end
