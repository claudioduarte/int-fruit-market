class MainController < ApplicationController
  def index
    if signed_in?
      @pagy_stock, @get_stock = pagy(VendorsFruit.where(vendor_id: current_user.vendor_id))
      @pagy_vendors, @vendors = pagy(Vendor.where(id: current_user.vendor_id))
    else
      @pagy_stock, @get_stock = pagy(VendorsFruit.all)
      @pagy_vendors, @vendors = pagy(Vendor.all)
    end

    #SORT STOCK
    if params[:sort] == "asc"
      @stock = sort_stock_ascending(@get_stock)
    else
      @stock = sort_stock_descending(@get_stock)
    end

    # HIDE NEGATIVE STOCK
    if params[:hide_negative_stock] == "true"
      hide_negative_stock(@get_stock)
    end
  end

  def search
    if params[:fruit].present?
      fruits_searched = Fruit.search_fruit(params[:fruit])
      @pagy_stock, @stock = pagy(VendorsFruit.where(fruit: fruits_searched))
    else
      flash[:error] = "Please enter a name of a fruit in order to search!"
      redirect_back(fallback_location: root_path)
    end
  end

  def sort_stock_ascending(vendors_fruits)
    vendors_fruits.sort_by{ |obj| obj.quantity }
  end

  def sort_stock_descending(vendors_fruits)
    vendors_fruits.sort_by{ |obj| obj.quantity }.reverse
  end

  def hide_negative_stock(vendors_fruits)
    positive_stock = []

    vendors_fruits.each do |v|
      if v.quantity >= 0
        positive_stock << v
      end
    end

    @stock = positive_stock
  end

end
