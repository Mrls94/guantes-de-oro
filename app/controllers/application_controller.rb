class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    users_sign_in_cashier_path
  end
end
