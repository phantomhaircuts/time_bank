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
  redirect_to profile_services_path(@profile, @service)
  end

  def edit
    @profile = Profile.find(params[:profile_id])
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @profile = Profile.find(params[:profile_id])
    @service.update(service_params.merge(profile: @profile))
    redirect_to profile_services_path(@service.profile, @service)
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private
  def service_params
    params.require(:service).permit(:name, :description, :price )
  end
end
