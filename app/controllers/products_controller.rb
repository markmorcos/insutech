class ProductsController < ApplicationController
  protected
  
  def product_params
    params.require(:product).permit(
                                      :name, :name_ar, :image, :category, :first_level, :second_level,
                                      :cold_flexibility, :carrier, :surface_finish, :description, :description_ar,
                                      :datasheet
                                    )
  end
end
