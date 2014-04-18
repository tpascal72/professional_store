ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
        column do
            panel "Unpaid Orders" do
                Corporation.includes(:orders).where(orders: {status: 'Unpaid'}).map do |company|
                #Order.where(status: 'Unpaid').map do |order|
                    h2 company.name

                    company.orders.each do |order|
                        h3 "Order Number: " + order.id.to_s
                        order_total = 0
                        order.rentals.each do |rental|
                            taxes = (rental.amount.round(2) * (order.pst_rate.round(5) + order.gst_rate.round(5) + order.hst_rate.round(5))).round(2)
                            b "Rental " + rental.id.to_s + " Amount: " + number_to_currency(rental.amount)  + " Taxes: " + number_to_currency(taxes) 
                            order_total += (taxes + rental.amount).round(2)
                            br
                        end
                        b "Order total: " + number_to_currency(order_total)
                        br
                        br
                    end
                end
            end
        end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
