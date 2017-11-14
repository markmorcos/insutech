class ApiSystemsController < ApiBaseController
  def index
    render json: System.where(system_id: nil).to_json(
      include: [
        { systems: {
          include: [
            { systems: {
              include: [
                { systems: {
                  include: [
                    { systems: {
                      include: [
                        { systems: {
                          include: [:systems, :system_products]
                        } }, :system_products
                      ]
                    } }, :system_products
                  ]
                } }, :system_products
              ]
            } }, :system_products
          ]
        } }, :system_products
      ]
    ) 
  end

  def show
    if System.where(id: params[:id]).present?
      render json: System.find(params[:id]).to_json(include: :system_products)
    else
      bad_request("System not found.")
    end
  end

  def systems
    @system = System.where(id: params[:system_id])
    if @system.present?
      render json: @system.first.systems
    else
      bad_request("System not found.")
    end
  end

  def products
    @system = System.where(id: params[:system_id])
    if @system.present?
      render json: @system.first.system_products
    else
      bad_request("System not found.")
    end
  end
 end
