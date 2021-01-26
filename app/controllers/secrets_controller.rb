class SecretsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:show]

  def show
      if current_user
          render "secret"
      else
          redirect_to "/login"
      end
  end

  private

  def require_login
      return head(:forbidden) unless session.include? :name
  end
  
end
