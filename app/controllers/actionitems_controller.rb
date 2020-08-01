class ActionitemsController < ApplicationController

  def index
    @actionitems = Actionitem.all
  end

  def show
    @actionitem = Actionitem.find(params[:id])
  end

  def new
    @actionitem = Actionitem.new
  end

  def edit
    @actionitem = Actionitem.find(params[:id])
  end

  def create
    @actionitem = Actionitem.new(actionitem_params)

    if @actionitem.save
      redirect_to @actionitem
    else
      render 'new'
    end
  end

  def update
    @actionitem = Actionitem.find(params[:id])

    if @actionitem.update(actionitem_params)
      redirect_to @actionitem
    else
      render 'edit'
    end
  end

  def destroy
    @actionitem = Actionitem.find(params[:id])
    @actionitem.destroy

    redirect_to actionitems_path
  end

  private
    def actionitem_params
      params.require(:actionitem).permit(:focus, :description, :owner, :due, :resources, :urgency, :importance)
    end

end
