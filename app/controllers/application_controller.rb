class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = :es
  end

  def check_session
    if current_user.session.nil?
      sign_out current_user
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def after_sign_in_path_for(resource)
    users_sign_in_cashier_path
  end
end
