class VendorsFruitsController < ApplicationController
  def new_quantity
    fruit_stock = VendorsFruit.find(params[:id])

    if params[:type] == "increment"
      new_quantity = fruit_stock.quantity + 1
    else
      new_quantity = fruit_stock.quantity - 1
    end

    fruit_stock.quantity = new_quantity

    if fruit_stock.save
      flash[:success] = "The total quantity for #{fruit_stock.fruit.name} was updated successfully!"
      redirect_to :root
    else
      flash[:error] = "An error has occurred. Please try again!"
      redirect_back(fallback_location: root_path)
    end

  end
end
