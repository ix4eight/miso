class ApplicationsController < ApplicationController

  def index
    
  end

  def new
      @library = Library.new
  end

  def create
    @library = Library.new(library_params)
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
    @library = Library.find(params[:id])
  end

  def update
    @library = Library.find(params[:id])
    if @library.update(post_params)
      redirect_to application_path(params[:id]), notice: '投稿を編集しました'
    else
      render :edit
    end
  end

  def destroy
    library = Library.find(params[:id])
    library.destroy
  end

  private
  def library_params
    params.permit(:twitter, :line, :instagram, :discord, :steam, :skype).merge(user_id: current_user.id)
  end

end
