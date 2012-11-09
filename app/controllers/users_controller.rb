class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def validate_manager
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    @marina = @user.marina
    @marina.pending_users.delete(@user)
    @marina.active_managers << @user
    @user.marina_state= "VALIDATED-MANAGER"
    redirect_to marina_path(@marina), :notice => "Manager and marina are now connected."
  end

  def expire_manager
      authorize! :update, @user, :message => 'Not authorized as an administrator.'
      @user = User.find(params[:id])
      @marina = @user.marina
      @marina.active_managers.delete(@user)
      @marina.expired_managers << @user
      @user.marina_state= "VALIDATED-MANAGER"
      redirect_to users_path, :notice => "Manager and marina are now connected."
   end

  def revalidate_manager
      authorize! :update, @user, :message => 'Not authorized as an administrator.'
      @user = User.find(params[:id])
      @marina = @user.marina
      @marina.expired_managers.delete(@user)
      @marina.active_managers << @user
      @user.marina_state= "VALIDATED-MANAGER"
      redirect_to users_path, :notice => "Manager and marina are now connected."
  end

  def remove_expired_manager
      authorize! :update, @user, :message => 'Not authorized as an administrator.'
      @user = User.find(params[:id])
      @marina = @user.marina
      @marina.expired_managers.delete(@user)
      @user.marina_state= "REMOVED-MANAGER"
      redirect_to users_path, :notice => "Manager has been removed."
  end

  def validate_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     @marina = @user.marina
     @marina.pending_users.delete(@user)
     @marina.active_users << @user
     @user.marina_state= "VALIDATED-BERTHOLDER"
     redirect_to users_path, :notice => "Bertholder and marina are now connected."
  end

  def expire_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     @marina = @user.marina
     @marina.active_users.delete(@user)
     @marina.expired_users << @user
     @user.marina_state= "EXPIRED-BERTHOLDER"
     redirect_to users_path, :notice => "Bertholder is now expired."
  end

  def revalidate_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     @marina = @user.marina
     @marina.expired_users.delete(@user)
     @marina.active_users << @user
     @user.marina_state= "VALIDATED-BERTHOLDER"
     redirect_to users_path, :notice => "Bertholder is now re-validated."
  end

  def remove_expired_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     @marina = @user.marina
     @marina.expired_users.delete(@user)
     @user.marina_state= "REMOVED-BERTHOLDER"
     redirect_to users_path, :notice => "Bertholder is now removed."
  end


  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end