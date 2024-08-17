class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def index
    @lists = List.all
    puts @lists.map(&:photo).inspect
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render "new", status: :unprocessable_entity
    end

  end

  private 

  def set_list
    @list = List.find(params[:id])
    raise ActiveRecord::RecordNotFound if @list.nil?
  end

  def strong_params
    params.require(:list).permit(:name, :photo)
  end
end