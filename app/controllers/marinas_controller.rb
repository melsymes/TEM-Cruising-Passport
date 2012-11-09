class MarinasController < ApplicationController
  # GET /marinas
  # GET /marinas.json
  def index
    #@marinas = Marina.all
    puts 'in index'
    #@marinas = Marina.all
    @marinas = Marina.search(params[:search])
    #@users = User.find_by_marina_id(@marina)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marinas }
    end
  end

  def pending
    @marina = Marina.find(params[:id])
    @user = current_user
    puts 'in connect'
    @marina.pending_users << @user
    @user.marina_state = "PENDING"
    @user.marina = @marina
    @marina.save
    @user.save


    respond_to do |format|
      format.html #pending.html.erb
      format.json { render json: @marina }
    end
  end

  # GET /marinas/1
  # GET /marinas/1.json
  def show
    @marina = Marina.find(params[:id])

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
