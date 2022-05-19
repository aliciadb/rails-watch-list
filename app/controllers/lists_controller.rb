class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    #@review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end
end
