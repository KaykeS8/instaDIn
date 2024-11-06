class ProfilesController < ApplicationController
    layout "dashboard"
    before_action :set_profile, only: [:show, :edit, :update]
    before_action :set_user, only: [:show, :followers, :followings]

    def show
        @followers = Friend.where(followed_id: @user.id)
        @followings = @user.followers
        @posts = @user.posts
    end

    def followers
        @followers = Friend.where(followed_id: @user.id)
    end

    def followings
        @followings = @user.followers
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

    def edit;end

    def update
        if @profile.update(profile_params)
            redirect_to profile_path, status: :ok, notice: 'Profile was updated'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def set_user
       @user = User.find_by(name: params[:user_name])
    end

    def set_profile
        @profile = current_user.profile
    end

    def profile_params
        params.require(:profile).permit(:bio, :photo_of_profile)
    end
end