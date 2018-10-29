class GuestsController < ApplicationController
  def search
    guest = Guest.find_by("fullname ILIKE ?", guest_params[:name])
    group = guest.group
    @guests = group.guests
    # @todo: add error handling logic for incorrect search
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
