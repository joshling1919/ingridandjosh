class GuestsController < ApplicationController
  def search
    guest = Guest.find_by("fullname ILIKE ?", guest_params[:name])
    if guest
      @group = guest.group
      @guests = @group.guests
      render :search
    else
      @error = true
      render 'rsvp/show'
    end
  end

  def rsvp
    guest_params[:id].each do |guest_id|
      guest = Guest.find(guest_id.to_i)
      guest.update!(
        attending: params['guest']['attendance'][guest_id],
        dietary_restrictions: params['guest']['diet'][guest_id]
      )
    end

    unless guest_params[:group_notes].empty?
      Guest.find(guest_params[:id][0].to_i)
           .group
           .update!(notes: guest_params[:group_notes])
    end
  end

  private

  def guest_params
    params.require(:guest).permit(
      :name,
      :group_notes,
      :diet,
      id: []
    )
  end
end
