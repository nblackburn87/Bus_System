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
    @line = Line.find(params[:id])
    if @line.update(line_params)
      flash[:notice] = "Line #{@line.name} updated successfully."
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
    params.require(:line).permit(:name)
  end
end
