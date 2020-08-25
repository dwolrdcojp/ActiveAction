class ActionitemsController < ApplicationController

  def index
    @actionitems = Actionitem.filter(params.slice(:id, :focus, :owner, :due, :priority, :status)).order("id DESC").page params[:page] 
    @past_due = Actionitem.all.count_past_due
    @past_due_ids = Actionitem.find_past_due
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
    @actionitem.due = Date.civil(params[:due][:year].to_i, params[:due][:month].to_i, params[:due][:day].to_i)
    @actionitem.status = "Open"

    if @actionitem.urgency == "Urgent" && @actionitem.importance == "Important"
      @actionitem.priority = "High"
    elsif @actionitem.urgency == "Not Urgent" && @actionitem.importance == "Not Important"
      @actionitem.priority = "Low"
    else
      @actionitem.priority = "Medium"
    end

    if @actionitem.save
      redirect_to @actionitem
    else
      render 'new'
    end
  end

  def update
    @actionitem = Actionitem.find(params[:id])
    
    @actionitem.completion = Date.civil(params[:completion][:year].to_i, params[:completion][:month].to_i, params[:completion][:day].to_i) unless params[:completion][:year].blank?

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
      params.require(:actionitem).permit(:id, :focus, :description, :owner, :due, :resources, :urgency, :importance, :status, :updates, :completion, :priority)
    end

    def filtering_params(params)
      params.slice(:id, :focus, :owner, :due, :priority, :status)
    end

end
