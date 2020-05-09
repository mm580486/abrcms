class ApplicationController < ActionController::Base
    before_action :getAuthenticate


    def getAuthenticate
        @form_auth_token = form_authenticity_token
    end
end
