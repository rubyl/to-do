class listsController < ApplicationController
  def index
    @lists = list.all
  end

  def show
    @list = list.find(params[:id])
  end

  def new
    @list = list.new
  end

  def create
    @list = list.new(list_params)

    if @list.save
      flash[:notice] = "list was saved successfully"
      redirect_to @list
    else
      flash.now[:alert] = "Error creating list. Please try again."
      render :new
    end
  end

  def edit
    @list = list.find(params[:id])
  end

  def update
    @list = list.find(params[:id])
    @list.assign_attributes(list_params)

    if @list.save
      flash[:notice] = "list was updated"
      redirect_to @list
    else
      flash.now[:alert] = "There was an error saving the list. Please try again."
      render :edit
    end
  end

  def destroy
    @list = list.find(params[:id])

    if @list.destroy
      flash[:notice] = "\"#{@list.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the list."
      render :show
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :private)
  end
end
