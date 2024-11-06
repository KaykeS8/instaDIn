class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, unless: :site_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    def after_sign_in_path_for(resource)
        posts_path
    end

    def after_sign_up_path_for(resource)
        new_profile_path
    end

    def check_profile
        if current_user && current_user.profile.nil?
            redirect_to new_profile_path, alert: 'Please create your profile'
        end
    end

    def site_controller?
        controller_name == 'site'
    end
end
