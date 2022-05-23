class ProfilesController < ApplicationController
  include CloudinaryHelper
  before_action :find_profile, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:query].present?
      sql_query = "location ILIKE :query"
      @profiles = Profile.geocoded.where(sql_query, query: "%#{params[:query]}%")
    else
      @profiles = Profile.geocoded
    end

    # @profiles = Profile.geocoded

    @markers = @profiles.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,
        info_window: render_to_string(partial: "info_window", locals: { profile: profile }),
        image_url: helpers.asset_url(cl_image_path(profile.photos.first.key))
      }
    end
  end

  def show
    @chat = current_user.chatrooms.find_by(profile: @profile)
    @profiles = Profile.geocoded
    @markers = @profiles.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,
        info_window: render_to_string(partial: "info_window", locals: { profile: profile }),
        image_url: helpers.asset_url(cl_image_path(profile.photos.first.key))
      }
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:description, :location, :price, :phone_number, photos: [])
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
