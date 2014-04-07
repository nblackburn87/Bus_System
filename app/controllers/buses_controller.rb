class BusesController < ApplicationController

  def index
    @buses = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    @line = Line.find(params[:bus][:line_id])
    if @bus.save
      @line.buses << @bus
      flash[:notice] = "bus #{@bus.id} created on #{@line.name}."
      redirect_to buses_path
    else
      render 'new'
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    if @bus.update(bus_params)
      flash[:notice] = "bus #{@bus.id} updated successfully."
      redirect_to bus_path(@bus)
    else
      render 'edit'
    end
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def destroy
    @bus = Bus.find(params[:id])
    @bus.destroy
    flash[:notice] = "bus #{@bus.id} deleted."
    redirect_to buses_path
  end

  private

  def bus_params
    params.require(:bus).permit(:line_id, :status)
  end
end
