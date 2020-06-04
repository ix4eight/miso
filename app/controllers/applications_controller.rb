class ApplicationsController < ApplicationController
  before_action :exists, only: [:new]

  def index
    
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params_new)
    if @library.save
      flash[:notice] = "成功"
      redirect_to application_path(current_user.id)
    else
      flash.now[:alert] = "失敗"
      render :new
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
      user = Library.find_by(user_id: current_user)
      if user
        redirect_to application_path(current_user.id)
      end
    end
  end

end
