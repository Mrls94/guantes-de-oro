# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    current_user&.sessions&.destroy_all
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    current_user&.sessions&.destroy_all
    super
  end

  def sign_in_cashier
    current_user&.sessions&.destroy_all
    @session = Session.new
  end

  def session_cashier
    session = Session.new
    session.user = current_user

    cashier_id = params[:session][:cashier_id]
    cashier = Cashier.find(cashier_id) if cashier_id.present?

    session.cashier = cashier

    session.save
    puts "Error: #{session.errors.inspect}"

    redirect_to '/'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
