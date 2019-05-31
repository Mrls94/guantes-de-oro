class SignInCommentsController < ApplicationController
  before_action :set_sign_in_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_session
  load_and_authorize_resource

  # GET /sign_in_comments
  # GET /sign_in_comments.json
  def index
    @sign_in_comments = SignInComment.order(created_at: :desc)
  end

  # GET /sign_in_comments/1
  # GET /sign_in_comments/1.json
  def show
  end

  # GET /sign_in_comments/new
  def new
    @sign_in_comment = SignInComment.new
    @cashier = current_user.session.cashier
    redirect_to '/' if @cashier.nil?
  end

  # GET /sign_in_comments/1/edit
  def edit
  end

  # POST /sign_in_comments
  # POST /sign_in_comments.json
  def create
    @sign_in_comment = SignInComment.new(sign_in_comment_params)
    @sign_in_comment.user = current_user
    @sign_in_comment.cashier = current_user.session.cashier
    @sign_in_comment.cashier_currency_values = current_user.session.cashier.currency_values.map do |cv| 
      {
        currency_id: cv.currency.id,
        currency_name: cv.currency.name,
        currency_value: cv.value
      }
    end

    respond_to do |format|
      if @sign_in_comment.save
        format.html { redirect_to '/' }
        format.json { render :show, status: :created, location: @sign_in_comment }
      else
        format.html { render :new }
        format.json { render json: @sign_in_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sign_in_comments/1
  # PATCH/PUT /sign_in_comments/1.json
  def update
    respond_to do |format|
      if @sign_in_comment.update(sign_in_comment_params)
        format.html { redirect_to @sign_in_comment, notice: 'Sign in comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @sign_in_comment }
      else
        format.html { render :edit }
        format.json { render json: @sign_in_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_in_comments/1
  # DELETE /sign_in_comments/1.json
  def destroy
    @sign_in_comment.destroy
    respond_to do |format|
      format.html { redirect_to sign_in_comments_url, notice: 'Sign in comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_in_comment
      @sign_in_comment = SignInComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_in_comment_params
      params.require(:sign_in_comment).permit(:comment, :anomaly)
    end
end
