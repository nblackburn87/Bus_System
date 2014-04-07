class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station #{@station.name} created."
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      flash[:notice] = "Station #{@station.name} updated successfully."
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "Station #{@station.name} deleted."
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name)
  end
end
