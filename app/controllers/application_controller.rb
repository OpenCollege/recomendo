class ApplicationController < ActionController::Base
   before_action :authenticate_user!
   layout :layout_by_resource

   def after_sign_in_path_for(resource)
     stored_location_for(resource) || posts_path
   end

   private

   def layout_by_resource
     if devise_controller?
       "devise"
     else
       "application"
     end
   end

  def home
  end
end
