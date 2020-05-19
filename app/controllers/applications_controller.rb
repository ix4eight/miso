class ApplicationsController < ApplicationController

  def index
  end

  def new
    @library = Library.new
    @library.twitter = 0
    @library.line = 0
    @library.instagram = 0
    @library.discord = 0
    @library.steam = 0
    @library.skype = 0
    @library.user_id = current_user.id
  end

  def create

  end

  private
  def library_params
    params.require(:library).permit(:twitter, :line, :instagram, :discord, :steam, :skype).merge(user_id: current_user.id)
  end
end
