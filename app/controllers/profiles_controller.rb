class ProfilesController < ApplicationController
    layout "dashboard"
    def show
        @posts = Post.where(user_id: current_user.id)
        @profile = Profile.where(user_id: current_user.id).first
    end

    def new
        @profile = Profile.new
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user_id = current_user.id
        if @profile.save
            redirect_to profile_path, status: :created, notice: 'Profile was created'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    private

    def profile_params
        params.require(:profile).permit(:bio, :photo_of_profile)
    end
end
