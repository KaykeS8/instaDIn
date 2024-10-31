class FriendsController < ApplicationController
    layout 'dashboard'
    def index
        @users = User.all
    end

    def create
        puts "BATEU HERE"
        puts params
    end

    def destroy
    end
end
