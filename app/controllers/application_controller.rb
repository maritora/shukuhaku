class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
  
    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon]) 
 #     added_attrs = [ :email, :name, :icon, :password, :password_confirmation ]
 #     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
 #     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
 #     devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

    def after_sign_up_path_for(resource)
        "/"
    end

    def index
        @user = User.find(params[:id])
    end
    
    def set_search
        @search = Room.ransack(params[:q])
        @search_rooms = @search.result(distinct: true).order(created_at: "DESC").includes(:user)
    end
end
