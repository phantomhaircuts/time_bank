class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  #show
  def show
    @service = Service.find(params[:id])
    @amount = @service.profile.time_bank


  end

  #create new services
  def new
    @profile = Profile.find(params[:profile_id])
    @service = Service.new
  end

  def create
  @profile = Profile.find(params[:profile_id])
  @sevice = Service.create!(service_params.merge(profile: @profile))
  redirect_to profile_service_path(@profile, @service)
end

end
