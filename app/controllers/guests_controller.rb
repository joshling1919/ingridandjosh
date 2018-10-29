class GuestsController < ApplicationController
  def search
    guest = Guest.find_by("fullname ILIKE ?", guest_params[:name])
    if guest
      group = guest.group
      @guests = group.guests
      render :search
    else
      @error = true
      render 'rsvp/show'
    end
  end

  def rsvp
    guest_params[:id].each do |guest_id|
    end
    byebug
  end

  private

  def guest_params
    params.require(:guest).permit(
      :name,
      :group_notes,
      diet: [],
      id: [],
    )
  end
end
