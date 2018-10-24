class GuestsController < ApplicationController
  def search
    @guests = 'hey hey'
  end

  private

  def guest_params
    params.require(:guest).permit(:name)
  end
end
