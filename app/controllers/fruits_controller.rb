class FruitsController < ApplicationController
  before_action :is_user_signed_in
  before_action :is_user_admin
  # MISSING A FILTER TO CHECK IF USER IS ALLOWED TO EDIT SPECIFIC FRUIT

  def edit
    @fruit = Fruit.find(params[:id])
  end

  def update
    @fruit = Fruit.find(params[:id])

    if @fruit.update(fruit_params)
      flash[:success] = "The fruit was updated successfully!"
      redirect_to :root
    else
      flash[:error] = "An error has occurred. Please try again!"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    fruit = Fruit.find(params[:id])

    if fruit.destroy
      flash[:success] = "Your fruit was deleted successfully!"
      redirect_to :root
    else
      flash[:error] = "Unable to delete fruit. Please try again!"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def fruit_params
    params.require(:fruit).permit(:name, :image_url, :description)
  end
end
