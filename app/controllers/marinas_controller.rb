class MarinasController < ApplicationController
  # GET /marinas
  # GET /marinas.json
  def index

    @marinas = Marina.search(params[:search])
    #@users = User.find_by_marina_id(@marina)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marinas }
    end
  end

  def pending
    #authorize! :update, @user, :message => t('errors.messages.not_authorized_as_manager')
    #users access this
    @marina = Marina.find(params[:id])
    @user = current_user
    @marina.pending_users << @user
    @user.marina_state = "PENDING"
    @marina.users << @user

    @marina.save!
    @user.save!

    if @marina.count_managers == 0
      # email all admins if there are no manager
      @admins = User.with_role :admin
      @admins.each do |admin|
        UserNotifier.new_initial_user(admin, @user).deliver
      end
    else
      # email all managers fro the appropriate user
      @managers = @marina.active_managers
      if !(@managers.count == 0)
        @managers.each do |manager|
          UserNotifier.new_user_to_manager(manager, @user).deliver unless manager.nil?
        end
      end
    end
    # email user of pending status
    UserNotifier.user_pending_notification(@user).deliver


    respond_to do |format|
      format.html { redirect_to @marina, notice: t('errors.messages.pending') }
      format.json { render json: @marina }
    end
  end

  # Create a linked user
  def create_user
    authorize! :update, @user, :message => t('errors.messages.not_authorized_as_manager')
    #@marina = Marina.find(params[:id])
    @marina = current_user.marina  #  try this
    anemail = params[:user_email]

    if User.exists?(email: anemail)
      redirect_to @marina, :alert => t('errors.messages.User_already_registered')
    else
      if anemail =~ /@/
        @marina.create_user(anemail)
        redirect_to @marina, notice: t('errors.messages.User_created_and_notified')
      else
        redirect_to @marina, :alert => t('errors.messages.User_created_and_notified')
      end
    end  
  end


  # GET /marinas/1
  # GET /marinas/1.json
  def show

    @marina = Marina.find(params[:id])
    @marina.active_managers.each do |manager|
      if manager == current_user
        @manager = current_user
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marina }
    end
  end

  # GET /marinas/new
  # GET /marinas/new.json
  def new
    @marina = Marina.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marina }
    end
  end

  # GET /marinas/1/edit
  def edit
    authorize! :update, @user, :message => t('errors.messages.not_authorized_as_manager')
    @marina = Marina.find(params[:id])
  end

  # POST /marinas
  # POST /marinas.json
  def create
    @marina = Marina.new(params[:marina])

    respond_to do |format|
      if @marina.save
        format.html { redirect_to @marina, notice: 'Marina was successfully created.' }
        format.json { render json: @marina, status: :created, location: @marina }
      else
        format.html { render action: "new" }
        format.json { render json: @marina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marinas/1
  # PUT /marinas/1.json
  def update
    authorize! :update, @user, :message => t('errors.messages.not_authorized_as_manager')
    @marina = Marina.find(params[:id])

    respond_to do |format|
      if @marina.update_attributes(params[:marina])
        format.html { redirect_to @marina, notice: 'Marina was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marinas/1
  # DELETE /marinas/1.json
  def destroy
    @marina = Marina.find(params[:id])
    @marina.destroy

    respond_to do |format|
      format.html { redirect_to marinas_url }
      format.json { head :no_content }
    end
  end
end
