require 'spree/order/state_machine_decorator.rb'

Spree::Order.class_eval do
  def name
    if (address = bill_address || ship_address)
      if Spree::Config[:company]
        address.company
      else
        "#{address.firstname} #{address.lastname}"
      end
    end
  end

  private
  def first_plan
    products.plan.first
  end
end



