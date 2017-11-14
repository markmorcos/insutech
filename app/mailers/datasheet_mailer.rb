class DatasheetMailer < ApplicationMailer
  default from: "\"Insutech Sales\" <local.team@insutech-eg.com>"
  layout "mailer"

  def send_datasheet(customer, product, surface_finish)
    @customer = customer
    @product = product
    @surface_finish = surface_finish
    Request.create(
                    customer: @customer, product: @product,
                    surface_finish: @surface_finish, request_type: "Datasheet"
                  )
    attachments[File.basename(@product.datasheet.current_path)] = File.read(@product.datasheet.current_path)
    attachments["selector_guide.pdf"] = File.read("/home/rails/rails_project/public/uploads/selector_guide.pdf")
    mail(
          to: @customer.email, cc: ["local.team@insutech-eg.com"],
          subject: "Insutech Datasheet Request"
        )
  end
end
