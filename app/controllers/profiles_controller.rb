class ProfilesController < ApplicationController
# index
  def index
    @profiles = Profile.all
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
end
