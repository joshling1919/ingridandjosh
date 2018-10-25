class GuestsController < ApplicationController
  def search
    @guests = ['Josh', 'Ingrid']
  end

  def rsvp
    guest_params[:id].each do |guest_id|
      Guest
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
