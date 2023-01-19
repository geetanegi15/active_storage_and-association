class ApplicationController < ActionController::Base
    include ActionView::Layouts
    include ActionController::Flash  
    #include ActionController::Helpers
    skip_before_action :verify_authenticity_token
    #def after_sign_in_path_for(resource)
    #    stored_location_for(resource) ||
    #      if resource.is_a?(AdminUser)
    #        admin_dashboard_path
    #      else
    #        root_path
    #      end
    #  end

end
