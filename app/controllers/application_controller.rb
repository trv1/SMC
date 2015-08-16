class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_current_user
  before_action :set_locale

  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
    def set_current_user
      if session[:user_id].present?
        @current_user=User.find(session[:user_id])
      end
    end

    def require_login
      if !@current_user
        flash[:danger]='Требуется авторизация'
        redirect_to login_path
      end
    end

    def manager_permission
      unless @current_user.try(:moderator?)
        flash[:danger]="Недостаточно прав"
        redirect_to login_path
      end
    end

    def admin_permission
      unless @current_user.try(:administrator?)
        flash[:danger]="Недостаточно прав"
        redirect_to login_path
      end
    end

    def current_polyclinic
      if params[:polyclinic_id].present?
        @current_polyclinic=Polyclinic.find(params[:polyclinic_id])
      end
    end
end
