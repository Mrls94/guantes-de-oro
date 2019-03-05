class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_session
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.order(id: :asc)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @edit = true
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        add_cashiers
        format.html { redirect_to users_path, notice: 'user was successfully created.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        add_cashiers
        format.html { redirect_to users_path, notice: 'user was successfully updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.update(active: false)
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario ha sido desactivado' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :active, :admin)
  end

  def add_cashiers
    return if params[:user][:cashier_ids].empty?

    cashier_ids = params[:user][:cashier_ids].map{ |id| id.to_i } - @user.cashiers.pluck(:id)
    @user.cashiers << Cashier.where(id: cashier_ids)
  end
end
