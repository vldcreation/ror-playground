class WelcomeController < ApplicationController
    def index
        {
            "message": "Welcome to the API",
        }
        
    end
end