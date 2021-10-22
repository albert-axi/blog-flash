class ApplicationController < ActionController::Base
  before_action :require_login, except: [:index]

  def require_login
    redirect_to '/login' unless session.include? :user_id
  end
end
