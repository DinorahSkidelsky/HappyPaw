class ProfilesController < ApplicationController
  before_action :find_profile, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:query].present?
      sql_query = "location ILIKE :query"
      @profiles = Profile.where(sql_query, query: "%#{params[:query]}%")
    else
      @profiles = Profile.all
    end
  end

  def show
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
