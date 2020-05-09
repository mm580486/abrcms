class AdminController < ApplicationController
    before_action :current_user
    layout 'admin'

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

end