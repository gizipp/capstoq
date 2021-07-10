module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!

    def authenticate_user!
      super

      unless current_user && current_user.admin?
        sign_out current_user

        flash[:error] = "You are not an admin"
        redirect_to root_path
      end
    end
  end
end
