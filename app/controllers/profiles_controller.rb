class ProfilesController < ApplicationController
# index
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
    @user = current_user
  end

  def create
    # instead of passing user_id in the form, which can be hacked, just use
    # current_user here to associate the created profile with the user who is
    # logged in. This is important because otherwise a user could spoof the
    # user_id value in the form, but they can't spoof current_user
    @profile = Profile.create!(profile_params)
    @profile.user = current_user
    @profile.save
    # or the short form:
    # @profile = current_user.create_profile(profile_params)
    redirect_to (profile_path(@profile))
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    # unnecessary indentation here!
    # also, it's a good idea to check that the current_user matches the profile
    # user before letting them update it
      @profile.update(profile_params)
      redirect_to profile_path(@profile)
  end

  # if you don't use this action, you should delete it, and remove the route
  # that takes you there!
  def destroy

  end

  private
  def profile_params
    params.require(:profile).permit(:name, :pic_url, :about_me, :user_id, :time_bank)
  end
end
