class LinesController < ApplicationController

  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      flash[:notice] = "Line #{@line.name} created."
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @station = Station.find(params[:line][:id])
    @line = Line.find(params[:id])
    if @line.update(line_params)
      unless @line.stations.include?(@station)
        @line.stations << @station
        flash[:notice] = "Line #{@line.name} updated successfully."
      end
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

  def show
    @line = Line.find(params[:id])
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "Line #{@line.name} deleted."
    redirect_to lines_path
  end

  private

  def line_params
    params.require(:line).permit(:name, :station_id)
  end
end
