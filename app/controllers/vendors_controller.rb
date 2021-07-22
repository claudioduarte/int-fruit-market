class VendorsController < ApplicationController
  include VendorsHelper

  before_action :is_user_signed_in
  before_action :is_user_admin
  # MISSING A FILTER TO CHECK IF USER IS ALLOWED TO EDIT SPECIFIC VENDOR

  def edit
    @vendor = Vendor.find(params[:id])
    get_countries_helper
  end

  def update
    @vendor = Vendor.find(params[:id])

    if @vendor.update(vendor_params)
      flash[:success] = "Your Vendor was updated successfully!"
      redirect_to :root
    else
      flash[:error] = "An error has occurred. Please try again!"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    vendor = Vendor.find(params[:id])

    if vendor.destroy
      flash[:success] = "Your Vendor was deleted successfully!"
      redirect_to :root
    else
      flash[:error] = "Unable to delete Vendor. Please try again!"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :country)
  end
end
