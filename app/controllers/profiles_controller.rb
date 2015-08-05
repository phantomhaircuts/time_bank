class ProfilesController < ApplicationController
# index
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  # def new
  #
  # end
  #
  # def create
  #
  # end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
      @profile.update(profile_params)
      redirect_to profile_path(@profile)
  end

  def destroy

  end

  private
  def profile_params
    params.require(:profile).permit(:name, :pic_url, :about_me)
  end
end
