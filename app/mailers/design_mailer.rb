class DesignMailer < ApplicationMailer
  default from: "\"Insutech Design\" <wedesign@insutech-eg.com>"
  layout "mailer"
  
  def send_design(customer)
    @customer = customer
    Request.create(customer: @customer, request_type: "Design")
    mail(
          to: @customer.email, cc: ["wedesign.team@insutech-eg.com"],
          subject: "Insutech Design Request"
        )
  end
end
