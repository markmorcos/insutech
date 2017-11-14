class SystemsController < ApplicationController
  protected
  
  def system_params
    params.require(:system).permit(:system_id, :name, :image_2d, :image_3d, product_ids: [])
  end
end
