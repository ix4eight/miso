class ApplicationsController < ApplicationController
  before_action :exists, only: [:index, :new]
  before_action :set_cache_buster

  def index
    
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params_new)
    if @library.twitter == 0 && @library.line == 0 && @library.instagram == 0 && @library.discord == 0 && @library.steam == 0 && @library.skype == 0
      flash.now[:alert] = "1つ以上選んでください"
      render :new
    else
      @library.save
      redirect_to application_path(current_user.id)
    end
  end

  def show
    @library = Library.find_by(user_id:current_user.id)
  end
  
  def edit
    @library = Library.find_by(user_id: current_user.id)
  end

  def update
    @library = Library.find_by(user_id: current_user.id)
    if @library.update(library_params_edit)
      redirect_to application_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    library = Library.find_by(user_id: current_user.id)
    library.destroy
  end

  private
  def library_params_edit
    params.require(:library).permit(:twitter, :line, :instagram, :discord, :steam, :skype).merge(user_id: current_user.id)
  end

  def library_params_new
    params.permit(:twitter, :line, :instagram, :discord, :steam, :skype).merge(user_id: current_user.id)
  end

  def exists
    if user_signed_in?
      user = Library.find_by(user_id: current_user.id)
      if user
        redirect_to application_path(current_user.id)
      end
    end
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
