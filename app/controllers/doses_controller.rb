class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    Dose.find(params[:id]).destroy
    redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
