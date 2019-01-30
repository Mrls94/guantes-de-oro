class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_session

  def hello
  end
end
