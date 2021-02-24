class ListsController < ApplicationController
  def index
    # List with capital 'L' = we call all actions on the 'class List'
    @lists = List.all
  end

  def new
    @list = List.new # needed to instantiate the form_for
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.save

    # no need for app/views/lists/create.html.erb
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
