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
    user = User.where(email: params[:user][:email]).first

    if user
      if user.active
        super
      else
        redirect_to '/users/sign_in', notice: 'Usuario desactivado'
      end
    else
      redirect_to '/users/sign_in', notice: 'Usuario no registrado'
    end
  end

  # DELETE /resource/sign_out
  def destroy
    current_user&.sessions&.destroy_all
    super
  end

  def sign_in_cashier
    current_user&.sessions&.destroy_all
    @session = Session.new

    @cashiers = if current_user.admin?
                  Cashier.no_session
                else
                  current_user.cashiers.no_session
                end
  end

  def session_cashier
    session = Session.new
    session.user = current_user

    cashier_id = params[:session] ? params[:session][:cashier_id] : nil
    cashier = Cashier.find(cashier_id) if cashier_id.present?

    session.cashier = cashier if cashier

    session.save

    if cashier
      redirect_to '/sign_in_comments/new'
    else
      redirect_to '/'
    end
  end

  def confirm_cashier_status
    @cashier = current_user.session.cashier
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
