class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:profile_id])
    @reservation.profile = @profile
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @profile = Profile.find(params[:profile_id])
    @reservation.profile = @profile
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to reservations_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :observation, :phone_number)
  end
end
