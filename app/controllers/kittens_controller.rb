class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end

  end

  def show 
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
    
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    @kitten.save

    flash[:notice] = "Kitten Created"

    redirect_to root_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update_attributes(kitten_params)
    @kitten.save

    flash[:notice] = "Kitten Updated"

    redirect_to kitten_path(@kitten)
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    flash[:notice] = "Kitten Deleted"

    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
