class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :manage, @user, :message => 'Not authorized as an administrator.'
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
    authorize! :update, @user, :message => 'Not authorized as an manager.'
    @user = User.find(params[:id])
    @marina = @user.marina
    @marina.pending_users.delete(@user)
    @marina.active_managers << @user
    UserNotifier.manager_accepted(@user).deliver
    @user.marina_state= "VALIDATED-MANAGER"
    @user.save
    @marina.save
    redirect_to marina_path(@marina), :notice => "Manager and marina are now connected."
  end

  def expire_manager
      authorize! :update, @user, :message => 'Not authorized as an manager.'
      @user = User.find(params[:id])
      puts @user


      @marina = @user.marina
      puts @marina
      @marina.active_managers.delete(@user)
      @marina.expired_managers << @user
      @user.marina_state= "EXPIRED-MANAGER"
      @user.save
      @marina.save
      UserNotifier.expired_manager(@user).deliver
      redirect_to marina_path(@marina), :notice => "Manager is now expired."
   end

  def revalidate_manager
      authorize! :update, @user, :message => 'Not authorized as an manager.'
      @user = User.find(params[:id])
      @marina = @user.marina
      @marina.expired_managers.delete(@user)
      @marina.active_managers << @user
      @user.marina_state= "VALIDATED-MANAGER"
      UserNotifier.manager_accepted(@user).deliver
      @user.save
      @marina.save
      redirect_to marina_path(@marina), :notice => "Manager and marina are now connected."
  end

  def remove_expired_manager
      authorize! :update, @user, :message => 'Not authorized as an manager.'
      @user = User.find(params[:id])
      @marina = @user.marina
      @marina.expired_managers.delete(@user)
      @user.marina_state= "REMOVED-MANAGER"
      @user.save
      @marina.save
      redirect_to marina_path(@marina), :notice => "Manager has been removed."
  end

  def validate_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     puts @user.marina
     @marina = @user.marina
     @marina.pending_users.delete(@user)
     @marina.active_users << @user
     @user.marina_state= "VALIDATED-BERTHOLDER"
     UserNotifier.accepted(@user).deliver
     @user.save
     @marina.save
     redirect_to marina_path(@marina), :notice => "Bertholder and marina are now connected. a notification email has been sent"
  end

  def expire_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     @marina = @user.marina
     @marina.active_users.delete(@user)
     UserNotifier.expired_user(@user).deliver
     @marina.expired_users << @user
     @user.marina_state= "EXPIRED-BERTHOLDER"
     UserNotifier.expired_user(@user).deliver
     @user.save
     @marina.save
     redirect_to marina_path(@marina), :notice => "Bertholder is now expired. a notification has been sent"
  end

  def revalidate_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     @marina = @user.marina
     @marina.expired_users.delete(@user)
     @marina.active_users << @user
     @user.marina_state= "VALIDATED-BERTHOLDER"
     UserNotifier.accepted(@user).deliver
     @user.save
     @marina.save
     redirect_to marina_path(@marina), :notice => "Bertholder is now re-validated. a notification has been sent"
  end

  def remove_expired_bertholder
     authorize! :update, @user, :message => 'Not authorized as an manager.'
     @user = User.find(params[:id])
     @marina = @user.marina
     @marina.expired_users.delete(@user)
     @user.marina_state= "REMOVED-BERTHOLDER"
     @user.save
     @marina.save
     redirect_to marina_path(@marina), :notice => "Bertholder is now removed."
  end


  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an manager.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def search
    authorize! :update, @user, :message => 'Not authorized as an manager.'
    @users = User.search(params[:search])
    #redirect_to root_path
  end


end