class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  #show
  def show
    @service = Service.find(params[:id])
    # this variable isn't used in the view, should remove it!
    @amount = @service.profile.time_bank
  end

  #create new services
  def new
    @profile = Profile.find(params[:profile_id])
    @service = Service.new
  end

  def create
  @profile = Profile.find(params[:profile_id])
  # really, if you want to limit people to create services for thier own profile
  # you should use current_user.profile instead of what's in params (as params
  # can be spoofed, current_user can't ):
  @sevice = current_user.profile.services.create!(service_params)

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
