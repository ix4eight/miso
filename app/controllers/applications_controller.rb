class ApplicationsController < ApplicationController

  def index
  end

  def new
    @library = Library.new
  end

  def create

  end

  private
  def library_params
    params.require(:library).permit(:twitter, :line, :instagram, :discord, :steam, :skype).merge(user_id: current_user.id)
  end
end
